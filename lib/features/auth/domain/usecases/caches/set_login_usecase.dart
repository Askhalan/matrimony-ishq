import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';

class SetLoginUC {
  final UserSessionRepository userSessionRepository;

  SetLoginUC({required this.userSessionRepository});
   call(EmptyParams parameters) {
    userSessionRepository.setLogedIn();
   
  }

}