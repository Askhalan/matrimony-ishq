part of 'auth_bloc.dart';

@immutable
 class AuthEvent  {}

final class AuthSignup extends AuthEvent{
  final String name ;
  final String password;
  final String mail;

  AuthSignup({required this.name, required this.password, required this.mail});
}