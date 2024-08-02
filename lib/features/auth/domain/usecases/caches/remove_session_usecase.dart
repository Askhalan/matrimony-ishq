import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';

class RemoveSessionUC {
  final UserSessionRepository userSessionRepository;
  RemoveSessionUC( this.userSessionRepository);
  Future call() async  {
   await userSessionRepository.removeLogedIn();
  }
}
