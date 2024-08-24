// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/domain/usecases/caches/check_login.dart';
import 'package:ishq/features/auth/domain/usecases/caches/remove_session_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/login_usecae.dart';
import 'package:ishq/features/auth/domain/usecases/logout_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthCheckStatus>(_onAuthCheckStatus);
    on<InitializeCurrentUser>(_onInitializeCurrentUser);
    on<AuthSignup>(_onAuthSIgnup);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
    on<SetLogin>(_onSetLogin);
    add(AuthCheckStatus());
  }

//------------------------------------------------- Signup ---------------------------------------------

  void _onAuthSIgnup(AuthSignup event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final userSignup = serviceLocator<UserSignupUC>();
    final res = await userSignup(UserSignupParams(
      email: event.mail,
      password: event.password,
    ));

    res.fold((l) => emit(AuthFailure(l.message)), (r) {
      emit(SignUpSuccess(r));
    });
  }

//------------------------------------------------- Login ----------------------------------------------

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final userLogin = serviceLocator<UserLoginUC>();
    final res = await userLogin(UserLoginParams(
      email: event.mail,
      password: event.password,
    ));

    res.fold((l) => emit(AuthFailure(l.message)), (r) {
      add(InitializeCurrentUser());
      emit(LoginSuccess(r));
    } );
  }

//------------------------------------------------- SET LOGIN ----------------------------------------------

  void _onSetLogin(SetLogin event, Emitter<AuthState> emit) async {
    final setLogin = serviceLocator<SetLoginUC>();
    await setLogin(EmptyParams());
  }
//------------------------------------------------------------------------------

  Future<void> _onAuthCheckStatus(
      AuthCheckStatus event, Emitter<AuthState> emit) async {
    final checkLogin = serviceLocator<CheckLoginUC>();
    final status = await checkLogin();

    if (status) {
      add(InitializeCurrentUser());
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  //------------------------------------------------- Logout ----------------------------------------------

  FutureOr<void> _onAuthLogout(
      AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final logoutUsecase = serviceLocator<LogoutUC>();
    final removeSessionUC = serviceLocator<RemoveSessionUC>();
    await logoutUsecase();
    await removeSessionUC();
    emit(AuthLogedOut());
  }

  void _onInitializeCurrentUser(
      InitializeCurrentUser event, Emitter<AuthState> emit) async {
    final fetchCurrentUserUC = serviceLocator<FetchCurrentUserUC>();
    final currentUserPreferencesUC =
        serviceLocator<FetchCurrentUserPreferencesUC>();

    final res = await fetchCurrentUserUC(EmptyParams());
    res.fold((l) => throw l, (r) {
      CurrentUser()
        ..uid = r.uid
        ..profileFor = r.profileFor
        ..name = r.name
        ..gender = r.gender
        ..dob = r.dob
        ..maritalStatus = r.maritalStatus
        ..physicalStatus = r.physicalStatus
        ..email = r.email
        ..phoneNo = r.phoneNo
        ..country = r.country
        ..state = r.state
        ..city = r.city
        ..bio = r.bio
        ..profileImage = r.profileImage
        ..education = r.education
        ..college = r.college
        ..employedIn = r.employedIn
        ..occupation = r.occupation
        ..organization = r.organization
        ..familyValues = r.familyValues
        ..familyStatus = r.familyStatus
        ..familyType = r.familyType
        ..familyAbout = r.familyAbout;
    });

    final preferences = await currentUserPreferencesUC(EmptyParams());
    preferences.fold((error) {
      // ignore: avoid_print
      print(error.message);
    }, (pref) {
      CurrentUserPreferences()
        ..ageStart = pref.ageStart
        ..ageEnd = pref.ageEnd
        ..heightStart = pref.heightStart
        ..heightEnd = pref.heightEnd
        ..educationPref = pref.educationPref
        ..maritalStatusPref = pref.maritalStatusPref
        ..jobPref = pref.jobPref
        ..isPrefAdded = true;
    });
  }
}
