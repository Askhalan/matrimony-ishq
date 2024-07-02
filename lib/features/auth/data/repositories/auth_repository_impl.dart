import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signupWithEmailPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
