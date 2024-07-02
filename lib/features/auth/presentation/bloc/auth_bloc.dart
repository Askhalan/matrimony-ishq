// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;

  AuthBloc({required UserSignup userSignup})
      : _userSignup = userSignup,
        super(AuthInitial()) {
    on<AuthSignup>((event, emit) async {
     final res = await _userSignup(UserSignupParams(
        email: event.mail,
        password: event.password,
        name: event.name,
      ));
      res.fold((l)=> emit(AuthFailure(l.message)), (r)=> emit(AuthSuccess(r)));
    });
  }
}
