import 'package:fpdart/src/either.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class SetLogin implements UseCase<void,EmptyParams>{
  final UserSessionRepository userSessionRepository;

  SetLogin({required this.userSessionRepository});
  @override
  Future<Either<Failure, void>> call(EmptyParams parameters) {
    userSessionRepository.setLogedIn();
    throw '';
  }

}