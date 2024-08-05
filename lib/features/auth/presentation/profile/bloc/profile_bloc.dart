// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/cubits/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/auth/domain/usecases/add_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SaveUserUsecase _saveUserUsecase;
  final FetchCurrentUserUsecase _fetchCurrentUserUsecase;
  final SetLogin _setLogin;
  final AddPreferencesUC _addPreferencesUC;

  ProfileBloc(
      {required SaveUserUsecase saveUser,
      required FetchCurrentUserUsecase fetchCurrentUser,
      required SetLogin setLoginUsecase,
      required AddPreferencesUC addPreferenceUC})
      : _saveUserUsecase = saveUser,
        _fetchCurrentUserUsecase = fetchCurrentUser,
        _setLogin = setLoginUsecase,
        _addPreferencesUC = addPreferenceUC,
        super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<AddAuthDetails>(_onAddAuthDetails);
    on<AddBasicDetails>(_onAddBasicDetails);
    on<AddAddressDetails>(_onAddAddressDetails);
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
  

    // Function to initialize the user profile
  // void _initializeProfile() async {
  //   final res = await _fetchCurrentUserUsecase(EmptyParams());
  //   res.fold(
  //     (error) => print(error),
  //     (user) {
  //       CurrentUser()
  //         ..uid = user.uid
  //         ..profileFor = user.profileFor
  //         ..name = user.name
  //         ..dob = user.dob
  //         ..maritalStatus = user.maritalStatus
  //         ..country = user.country
  //         ..state = user.state
  //         ..profileImage = user.profileImage;
        
  //       // add(InitializeProfileSuccess()); // Emit an event to update the state
  //     },
  //   );
  //   log('User Initialization Completed');
  // }

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
          profileImage: null));
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
        physicalStatus: event.physicalStatus,
      ));
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
        city: event.city,
      ));
    }
  }

//------------------------------------------------------------------------------

  void _onAddPhotos(AddProfilePhoto event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      log(event.profileImage!.path);
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
    ));

    res.fold((l) => emit(ProfileFailure(error: l.message)),
        (r) => emit(ProfileSuccess()));
  }

  //------------------------------------------------------------------------------
  void handleProfileSuccess() async {
    final res = await _fetchCurrentUserUsecase(EmptyParams());
    res.fold((error) => print(error), (r) {
      CurrentUser()
        ..uid = r.uid
        ..profileFor = r.profileFor
        ..name = r.name
        ..dob = r.dob
        ..maritalStatus = r.maritalStatus
        ..country = r.country
        ..state = r.state
        ..profileImage = r.profileImage;
    });
    await _setLogin(EmptyParams());
  }

  void initializeProfile() async {
    final res = await _fetchCurrentUserUsecase(EmptyParams());
    res.fold((error) => print(error), (r) {
      CurrentUser()
        ..uid = r.uid
        ..profileFor = r.profileFor
        ..name = r.name
        ..dob = r.dob
        ..maritalStatus = r.maritalStatus
        ..country = r.country
        ..state = r.state
        ..profileImage = r.profileImage;
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
    res.fold((l) => emit(AddPreferencesFailure(error: l.message)),
        (r) => emit(AddPreferencesSuccess()));
  }

}
