part of 'auth_bloc.dart';

@immutable

sealed class AuthState {
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}


final class AuthAuthenticated extends AuthState {}

final class AuthUnauthenticated extends AuthState {}

final class SignUpSuccess extends AuthState {
  final String uid;
  SignUpSuccess(this.uid);
}

final class LoginSuccess extends AuthState {
  final String uid;
  LoginSuccess(this.uid);
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

final class AuthLogedOut extends AuthState {}