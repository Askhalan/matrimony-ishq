// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/features/auth/domain/usecases/login_usecae.dart';

import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;
  final UserLogin _userLogin;

  AuthBloc({required UserSignup userSignup, required UserLogin userLogin})
      : _userSignup = userSignup,
        _userLogin = userLogin,
        super(AuthInitial()) {
    on<AuthSignup>(_onAuthSIgnup);
    on<AuthLogin>(_onAuthLogin);
  }

//------------------------------------------------- Signup ---------------------------------------------

  void _onAuthSIgnup(AuthSignup event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignup(UserSignupParams(
      email: event.mail,
      password: event.password,
      name: event.name,
    ));

    res.fold((l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
  }

//------------------------------------------------- Login ----------------------------------------------

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(UserLoginParams(
      email: event.mail,
      password: event.password,
    ));

    res.fold((l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
  }
}
