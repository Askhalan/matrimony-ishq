import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';

class CheckLogin {
  final UserSessionRepository userSessionRepository;
  CheckLogin({required this.userSessionRepository});
  Future<bool> call() async {
    final res = await userSessionRepository.checkLogedIn();
    return res;
  }
}
