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
}

class RequestDataSourceImpl implements RequestDatasource {
  RequestDataSourceImpl({required this.db, required this.auth});

  final FirebaseFirestore db;
  final FirebaseAuth auth;

//-----------------------------------------SEND REQUEST---------------------------------------
  @override
  Future<void> sendMatchRequest({required MatchRequestModel request}) async {
    try {
      await db.collection("requests").add(request.toJson());
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

//---------------------------------------GET SENT REQUEST -----------------------------------------

  @override
  Stream<List<UserModelMatch>> getSentRequestsStream() {
    try {
      return db
          .collection('requests')
          .where('senderId', isEqualTo: auth.currentUser!.uid)
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
//---------------------------------------GET ACCEPTED REQUEST -----------------------------------------

  @override
  Stream<List<UserModelMatch>> getAcceptedRequestsStream() {
    try {
      return db
          .collection('requests')
          .where('status', isEqualTo: 'accepted')
          .where('senderId', isEqualTo: auth.currentUser!.uid)
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
