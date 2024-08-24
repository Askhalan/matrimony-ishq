import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class UserLoginUC implements UseCase<String, UserLoginParams> {
  final AuthRepository authRepository;

  UserLoginUC(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserLoginParams parameters) async {
  return await authRepository.loginWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;


  UserLoginParams({
    required this.email,
    required this.password,
  });
}
