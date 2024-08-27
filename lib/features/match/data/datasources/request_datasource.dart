import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/match/data/models/match_request_model.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

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
      await db.collection("requests").doc().set(request.toJson());
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
  Future<void> acceptMatchRequest(String requestId) async {
    try {
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
          .where('receiverId', isEqualTo: auth.currentUser!.uid)
          .snapshots()
          .asyncMap((snapshot) async {
        log('Snapshot size from GET RECEIVED REQUEST : ${snapshot.size}');

        // Extract UIDs from requests
        final List<String> requestedUids =
            snapshot.docs.map((doc) => doc['requestedId'] as String).toList();

        // Fetch user details in batches
        final List<UserModelMatch> users =
            await fetchUsersByBatch(requestedUids);

        log('Fetched users length from GET RECEIVED REQUEST: ${users.length}');
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
      return db
          .collection('requests')
          .where('status', isEqualTo: 'accepted')
          .where('requesterId', isEqualTo: auth.currentUser!.uid)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => UserModelMatch.fromJson(doc))
              .toList());
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
}
