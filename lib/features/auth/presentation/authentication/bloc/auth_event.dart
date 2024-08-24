part of 'auth_bloc.dart';

@immutable
class AuthEvent {}

final class InitializeCurrentUser extends AuthEvent{}

final class AuthCheckStatus extends AuthEvent {}

final class SetLogin extends AuthEvent {}


final class AuthSignup extends AuthEvent {
  final String password;
  final String mail;
  AuthSignup({required this.password, required this.mail});
}


final class AuthLogin extends AuthEvent {
  final String password;
  final String mail;
  AuthLogin({required this.password, required this.mail});
}


final class AuthLogout extends AuthEvent {}
