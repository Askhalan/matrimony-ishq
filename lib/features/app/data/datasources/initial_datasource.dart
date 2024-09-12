import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ishq/features/app/data/models/app_data_model.dart';
import 'package:ishq/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ishq/utils/exceptions/firebase_exceptions.dart';
import 'package:ishq/utils/exceptions/format_exceptions.dart';
import 'package:ishq/utils/exceptions/platform_exceptions.dart';

abstract interface class InitialDatasource {
  Future<AppDataModel> fetchAppData();
  //--------------------------------------------------
}

class ChatDatasourceImpl extends InitialDatasource {
  ChatDatasourceImpl({
    required this.db,
  });
  final FirebaseFirestore db;

  @override
  Future<AppDataModel> fetchAppData() {
    try {
      

    } on FirebaseAuthException catch (e) {
      throw JFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw const JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    }
    throw UnimplementedError();
  }
}
