import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
class LogoutUC {
  final AuthRepository authRepository;
  LogoutUC(this.authRepository);
  Future call() async {
    await authRepository.logout();
  }
}
