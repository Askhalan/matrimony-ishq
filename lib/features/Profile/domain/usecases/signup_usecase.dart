import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class UserSignup implements UseCase<String, UserSignupParams> {
  final AuthRepository authRepository;

  UserSignup(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignupParams parameters) async {
    return await authRepository.signupWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
  }
}

class UserSignupParams {
  final String email;
  final String password;

  UserSignupParams({
    required this.email,
    required this.password,
  });
}
