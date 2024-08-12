// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/sessions/current_user.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/auth/domain/usecases/add_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SaveUserUsecase _saveUserUsecase;
  final FetchCurrentUserUsecase _fetchCurrentUserUsecase;
  final SetLogin _setLogin;
  final AddPreferencesUC _addPreferencesUC;
  final FetchCurrentUserPreferencesUC _currentUserPreferencesUC;

  ProfileBloc(
      {required SaveUserUsecase saveUser,
      required FetchCurrentUserUsecase fetchCurrentUser,
      required SetLogin setLoginUsecase,
      required AddPreferencesUC addPreferenceUC,
      required FetchCurrentUserPreferencesUC fetchCurrentUserPreference})
      : _saveUserUsecase = saveUser,
        _fetchCurrentUserUsecase = fetchCurrentUser,
        _setLogin = setLoginUsecase,
        _addPreferencesUC = addPreferenceUC,
        _currentUserPreferencesUC = fetchCurrentUserPreference,
        super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<AddAuthDetails>(_onAddAuthDetails);
    on<AddBasicDetails>(_onAddBasicDetails);
    on<AddProfessionalDetails>(_onAddProfessionalDetails);
    on<AddAddressDetails>(_onAddAddressDetails);
    on<AddFamilyDetails>(_onAddFamilyDetails);
    on<AddProfilePhoto>(_onAddPhotos);
    on<SaveUser>(_onSaveUser);
    on<AddPreferences>(_onAddPreferences);
  }

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    super.onTransition(transition);

    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is ProfileSuccess) {
      handleProfileSuccess();
    }
  }

//------------------------------------------------------------------------------

  void _onAddAuthDetails(AddAuthDetails event, Emitter<ProfileState> emit) {
    if (state is ProfileInitial) {
      emit(SignupData(
          uid: '',
          email: event.email,
          profileFor: '',
          name: '',
          gender: '',
          dob: '',
          maritalStatus: '',
          physicalStatus: '',
          phoneNo: '',
          country: '',
          state: '',
          city: '',
          bio: '',
          profileImage: null,
          education: '',
          college: '',
          employedIn: '',
          occupation: '',
          organization: '',
          familyValues: '',
          familyStatus: '',
          familyType: '',
          familyAbout: ''));
    }
  }

//------------------------------------------------------------------------------

  void _onAddBasicDetails(AddBasicDetails event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;

      emit(currentState.copyWith(
          profileFor: event.profileFor,
          name: event.name,
          gender: event.gender,
          dob: event.dob,
          maritalStatus: event.maritalStatus,
          physicalStatus: event.physicalStatus));
    }
  }

//------------------------------------------------------------------------------

  void _onAddProfessionalDetails(
      AddProfessionalDetails event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      emit(currentState.copyWith(
          education: event.education,
          college: event.college,
          employedIn: event.employedIn,
          occupation: event.education,
          organization: event.organization));
    }
  }

//------------------------------------------------------------------------------

  void _onAddFamilyDetails(AddFamilyDetails event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      emit(currentState.copyWith(
          familyValues: event.familyValues,
          familyAbout: event.familyAbout,
          familyStatus: event.familyStatus,
          familyType: event.familyType));
    }
  }

//------------------------------------------------------------------------------

  void _onAddAddressDetails(
      AddAddressDetails event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      emit(currentState.copyWith(
          phoneNo: event.phoneNo,
          country: event.country,
          state: event.state,
          city: event.city));
    }
  }

//------------------------------------------------------------------------------

  void _onAddPhotos(AddProfilePhoto event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;

      emit(currentState.copyWith(profileImage: event.profileImage));
    }
  }

//------------------------------------------------------------------------------

  void _onSaveUser(SaveUser event, Emitter<ProfileState> emit) async {
    final currentState = state as SignupData;
    emit(ProfileLoading());
    final res = await _saveUserUsecase(UserDataParams(
      uid: currentState.uid ?? '',
      profileFor: currentState.profileFor,
      name: currentState.name,
      gender: currentState.gender,
      dob: currentState.dob,
      maritalStatus: currentState.maritalStatus,
      email: currentState.email,
      physicalStatus: currentState.physicalStatus,
      phoneNo: currentState.phoneNo,
      country: currentState.country,
      state: currentState.state,
      city: currentState.city,
      bio: currentState.bio,
      profileImage: currentState.profileImage,
      education: currentState.education,
      college: currentState.college,
      employedIn: currentState.employedIn,
      occupation: currentState.occupation,
      organization: currentState.organization,
      familyValues: currentState.familyValues,
      familyStatus: currentState.familyStatus,
      familyType: currentState.familyType,
      familyAbout: currentState.familyAbout,
    ));

    res.fold((l) => emit(ProfileFailure(error: l.message)),
        (r) => emit(ProfileSuccess()));
  }

  //------------------------------------------------------------------------------
  void handleProfileSuccess() async {
    final res = await _fetchCurrentUserUsecase(EmptyParams());
    res.fold((error) => print(error), (r) {
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
    preferences.fold((error){ log('Preference fetching got eroor { from bloc : profile success}');}, (pref) {
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

  FutureOr<void> _onAddPreferences(
      AddPreferences event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final res = await _addPreferencesUC(PreferencesParams(
      uid: event.uid,
      ageStart: event.ageStart,
      ageEnd: event.ageEnd,
      heightStart: event.heightStart,
      heightEnd: event.heightEnd,
      maritalStatusPref: event.maritalStatusPref,
      educationPref: event.educationPref,
      jobPref: event.jobPref,
    ));
    CurrentUserPreferences()
      ..ageStart = event.ageStart
      ..ageEnd = event.ageEnd
      ..heightStart = event.heightStart
      ..heightEnd = event.heightEnd
      ..educationPref = event.educationPref
      ..maritalStatusPref = event.maritalStatusPref
      ..jobPref = event.jobPref
      ..isPrefAdded = true;
    final preferences = await _currentUserPreferencesUC(EmptyParams());
    preferences.fold((error) => null, (pref) {
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
    res.fold((l) => emit(AddPreferencesFailure(error: l.message)),
        (r) => emit(AddPreferencesSuccess()));
  }
}
