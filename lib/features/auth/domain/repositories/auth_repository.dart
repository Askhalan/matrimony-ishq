import 'package:fpdart/fpdart.dart';
import 'package:ishq/utils/error/failure.dart';

abstract  class AuthRepository {
  Future<Either<Failure, String>>signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, String>>loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
