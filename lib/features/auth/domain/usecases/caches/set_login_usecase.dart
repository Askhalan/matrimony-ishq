import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';

class SetLogin {
  final UserSessionRepository userSessionRepository;

  SetLogin({required this.userSessionRepository});
   call(EmptyParams parameters) {
    userSessionRepository.setLogedIn();
   
  }

}