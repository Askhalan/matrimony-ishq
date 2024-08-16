// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
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
  final UserSignup _userSignup;
  final UserLogin _userLogin;
  final FetchCurrentUserUsecase _fetchCurrentUserUsecase;
  final CheckLogin _checkLogin;
  final SetLogin _setLogin;
  final LogoutUC _logoutUsecase;
  final RemoveSessionUC _removeSessionUC;
  final FetchCurrentUserPreferencesUC _currentUserPreferencesUC;

  AuthBloc(
      {required UserSignup userSignup,
      required UserLogin userLogin,
      required FetchCurrentUserUsecase fetchCurrentUser,
      required CheckLogin checkLoginUsecse,
      required SetLogin setLoginUsecase,
      required LogoutUC logoutUsecase,
      required RemoveSessionUC removeSessionUC,
      required FetchCurrentUserPreferencesUC fetchCurrentUserPreference})
      : _userSignup = userSignup,
        _userLogin = userLogin,
        _fetchCurrentUserUsecase = fetchCurrentUser,
        _checkLogin = checkLoginUsecse,
        _setLogin = setLoginUsecase,
        _logoutUsecase = logoutUsecase,
        _removeSessionUC = removeSessionUC,
        _currentUserPreferencesUC = fetchCurrentUserPreference,
        super(AuthInitial()) {
    on<AuthCheckStatus>(_onAuthCheckStatus);
    on<AuthSignup>(_onAuthSIgnup);
    on<AuthLogin>(_onAuthLogin);
    on<AuthLogout>(_onAuthLogout);
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);

    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is LoginSuccess) {
      handleprofileSuccess();
    }
    if (transition.nextState is AuthAuthenticated) {
      handleprofileSuccess();
    }
  }
//------------------------------------------------- Signup ---------------------------------------------

  void _onAuthSIgnup(AuthSignup event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignup(UserSignupParams(
      email: event.mail,
      password: event.password,
    ));

    res.fold(
        (l) => emit(AuthFailure(l.message)), (r) => emit(SignUpSuccess(r)));
  }

//------------------------------------------------- Login ----------------------------------------------

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userLogin(UserLoginParams(
      email: event.mail,
      password: event.password,
    ));

    res.fold((l) => emit(AuthFailure(l.message)), (r) => emit(LoginSuccess(r)));
  }

  //------------------------------------------------------------------------------

  void handleprofileSuccess() async {
    log('handle Profile success working ');
    final res = await _fetchCurrentUserUsecase(EmptyParams());
    res.fold((l) => throw l, (r) {
      CurrentUser()
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
    await _setLogin(EmptyParams());

    final preferences = await _currentUserPreferencesUC(EmptyParams());
    preferences.fold((error) {
      log(error.message);
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
         log('Preferences have been updated');
    });
  }

//------------------------------------------------------------------------------

  Future<void> _onAuthCheckStatus(
      AuthCheckStatus event, Emitter<AuthState> emit) async {
    final status = await _checkLogin();

    if (status) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  //------------------------------------------------- Logout ----------------------------------------------

  FutureOr<void> _onAuthLogout(
      AuthLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await _logoutUsecase();
    await _removeSessionUC();
    emit(AuthLogedOut());
  }
}
