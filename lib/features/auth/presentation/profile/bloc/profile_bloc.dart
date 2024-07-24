// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print

import 'package:bloc/bloc.dart';
import 'package:ishq/core/common/cubits/current_user.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SaveUserUsecase _saveUserUsecase;
  final FetchCurrentUserUsecase _fetchCurrentUserUsecase;
  final SetLogin _setLogin;

  ProfileBloc(
      {required SaveUserUsecase saveUser,
      required FetchCurrentUserUsecase fetchCurrentUser,
      required SetLogin setLoginUsecase})
      : _saveUserUsecase = saveUser,
        _fetchCurrentUserUsecase = fetchCurrentUser,
        _setLogin = setLoginUsecase,
        super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<AddAuthDetails>(_onAddAuthDetails);
    on<AddBasicDetails>(_onAddBasicDetails);
    on<AddAddressDetails>(_onAddAddressDetails);
    on<AddPhotos>(_onAddPhotos);
    on<SaveUser>(_onSaveUser);
  }

  @override
  void onTransition(Transition<ProfileEvent, ProfileState> transition) {
    super.onTransition(transition);

    // Perform an action when transitioning to ProfileSuccess state
    if (transition.nextState is ProfileSuccess) {
      handleprofileSuccess();
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
          profileImage: ''));
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

  void _onAddPhotos(AddPhotos event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      emit(currentState.copyWith(profileImage: event.profileImage));
    }
  }

//------------------------------------------------------------------------------

  void _onSaveUser(SaveUser event, Emitter<ProfileState> emit) async {
    final currentState = state as SignupData;
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
  void handleprofileSuccess() async {
    final res = await _fetchCurrentUserUsecase(EmptyParams());
    res.fold((error) => print(error), (r) {
      CurrentUser()
        ..uid = r.uid
        ..profileFor = r.profileFor
        ..name = r.name
        ..dob = r.dob
        ..maritalStatus = r.maritalStatus
        ..country = r.country
        ..state = r.state;
    });
    await _setLogin(EmptyParams());
  }
}
