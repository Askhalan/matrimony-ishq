import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/app/data/models/match_request_model.dart';
import 'package:ishq/features/app/data/models/user_model_match.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class RequestDatasource {
  Future<void> sendMatchRequest({required MatchRequestModel request});
  Future<void> acceptMatchRequest(String requestId);
  Stream<List<UserModelMatch>> getSentRequestsStream();
  Stream<List<UserModelMatch>> getReceivedRequestsStream();
  Stream<List<UserModelMatch>> getAcceptedRequestsStream();
  Future<List<UserModelMatch>> fetchUsersByBatch(List<String> uids);
}

//---------------------------------------FETCH USERS BY BATCH -----------------------------------

class RequestDataSourceImpl implements RequestDatasource {
  RequestDataSourceImpl({required this.db, required this.auth});

  final FirebaseFirestore db;
  final FirebaseAuth auth;

  @override
  Future<List<UserModelMatch>> fetchUsersByBatch(List<String> uids) async {
    // Split the list into batches of 10 (Firestore's whereIn limit)
    final batches = <Future<List<UserModelMatch>>>[];

    for (var i = 0; i < uids.length; i += 10) {
      final batchUids =
          uids.sublist(i, i + 10 > uids.length ? uids.length : i + 10);
      batches.add(db
          .collection('users')
          .where(FieldPath.documentId, whereIn: batchUids)
          .get()
          .then((snapshot) => snapshot.docs.map((doc) {
                return UserModelMatch.fromJson(doc);
              }).toList()));
    }

    // Wait for all batches to complete and then combine the results
    final results = await Future.wait(batches);
    return results.expand((x) => x).toList(); // Flatten the list of lists
  }

//-----------------------------------------SEND REQUEST---------------------------------------
  @override
  Future<void> sendMatchRequest({required MatchRequestModel request}) async {
    try {
      final String requestId = DataHelper.generateChatID(
          uid1: request.requestedId, uid2: request.requesterId);
      await db.collection("requests").doc(requestId).set(request.toJson());
      // .add(request.toJson());
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . Please try again';
    }
  }

//-------------------------------------------ACCEPT REQUEST-------------------------------------

  @override
  Future<void> acceptMatchRequest(String requestedUserUid) async {
    try {
      final String requestId = DataHelper.generateChatID(
          uid1: auth.currentUser!.uid, uid2: requestedUserUid);
      await db.collection('requests').doc(requestId).update({
        'status': 'accepted',
      });
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . Please try again';
    }
  }

//---------------------------------------GET RECEIVED REQUEST -----------------------------------------

  @override
  Stream<List<UserModelMatch>> getReceivedRequestsStream() {
    try {
      return db
          .collection('requests')
          .where('requestedId', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: 'pending')
          .snapshots()
          .asyncMap((snapshot) async {
        // Extract UIDs from requests
        final List<String> requestedUids =
            snapshot.docs.map((doc) => doc['requesterId'] as String).toList();

        // Fetch user details in batches
        final List<UserModelMatch> users =
            await fetchUsersByBatch(requestedUids);

       
        return users;
      });
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . Please try again';
    }
  }

//---------------------------------------GET SENT REQUEST -----------------------------------------

  @override
  Stream<List<UserModelMatch>> getSentRequestsStream() {
    try {
      return db
          .collection('requests')
          .where('requesterId', isEqualTo: auth.currentUser!.uid)
          .where('status', isEqualTo: 'pending')
          .snapshots()
          .asyncMap((snapshot) async {
        // Extract UIDs from requests
        final List<String> requestedUids =
            snapshot.docs.map((doc) => doc['requestedId'] as String).toList();

        // Fetch user details in batches
        final List<UserModelMatch> users =
            await fetchUsersByBatch(requestedUids);

        return users;
      });
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong . Please try again';
    }
  }
//---------------------------------------GET ACCEPTED REQUEST -----------------------------------------

  @override
  Stream<List<UserModelMatch>> getAcceptedRequestsStream() {
    try {
      // Stream for requests where the user is the requester
      final requesterStream = db
          .collection('requests')
          .where('status', isEqualTo: 'accepted')
          .where('requesterId', isEqualTo: auth.currentUser!.uid)
          .snapshots();

      // Stream for requests where the user is the requested
      final requestedStream = db
          .collection('requests')
          .where('status', isEqualTo: 'accepted')
          .where('requestedId', isEqualTo: auth.currentUser!.uid)
          .snapshots();

      // Combine the two streams and process the results
      return Rx.combineLatest2(requesterStream, requestedStream,
          (QuerySnapshot requesterSnapshot,
              QuerySnapshot requestedSnapshot) async {
        // Extract UIDs from both sets of requests
        final List<String> requestedUids = requesterSnapshot.docs
            .map((doc) => doc['requestedId'] as String)
            .toList();
        final List<String> requesterUids = requestedSnapshot.docs
            .map((doc) => doc['requesterId'] as String)
            .toList();

        // Combine the UIDs
        final List<String> combinedUids = [...requestedUids, ...requesterUids];

        // Fetch user details in batches
        final List<UserModelMatch> users =
            await fetchUsersByBatch(combinedUids);

        log('Fetched users length from GET RECEIVED REQUEST: ${users.length}');
        return users;
      }).asyncMap((usersFuture) async => await usersFuture);
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }
}
