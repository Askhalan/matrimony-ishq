import 'package:ishq/features/auth/data/datasources/local_preference_datasource.dart';
import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';

class UserSessionRepositoryImpl extends UserSessionRepository {
  final LocalPrefDatasource localPrefDatasource;
  UserSessionRepositoryImpl({required this.localPrefDatasource});

  @override
  Future<bool> checkLogedIn()async {
    return await localPrefDatasource.getUserLogedIn();
  }

  @override
  Future<void> setLogedIn() async {
    try {
     await localPrefDatasource.setUserLogedIn();
    } catch (e) {
      throw '';
    }
  }
  
  @override
  Future<void> removeLogedIn()async {
   try {
     await localPrefDatasource.removeUserLogedIn();
    } catch (e) {
      throw '';
    }
  }
}
