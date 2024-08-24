// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/domain/usecases/add_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/edit_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<AddAuthDetails>(_onAddAuthDetails);
    on<AddBasicDetails>(_onAddBasicDetails);
    on<AddProfessionalDetails>(_onAddProfessionalDetails);
    on<AddAddressDetails>(_onAddAddressDetails);
    on<AddFamilyDetails>(_onAddFamilyDetails);
    on<AddProfilePhoto>(_onAddPhotos);
    on<SaveUser>(_onSaveUser);
    on<AddPreferences>(_onAddPreferences);
    on<EditPreferences>(_onEditPreferences);
    on<FetchCurrentUserPref>(_onFetchCurrentUserPref);
  }

//--------------------------------------- SIGNUP -1 ---------------------------------------

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

//--------------------------------------- SIGNUP -2 ---------------------------------------

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

//--------------------------------------- SIGNUP -3 ---------------------------------------

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

//--------------------------------------- SIGNUP -4 ---------------------------------------

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

//--------------------------------------- SIGNUP -5 ---------------------------------------

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

//--------------------------------------- SIGNUP -6 ---------------------------------------

  void _onAddPhotos(AddProfilePhoto event, Emitter<ProfileState> emit) {
    if (state is SignupData) {
      final currentState = state as SignupData;
      emit(currentState.copyWith(profileImage: event.profileImage));
    }
  }

//--------------------------------------- SAVE USER ---------------------------------------

  void _onSaveUser(SaveUser event, Emitter<ProfileState> emit) async {
    final saveUserUsecase = serviceLocator<SaveUserUC>();
    final currentState = state as SignupData;
    emit(ProfileLoading());
    final res = await saveUserUsecase(UserDataParams(
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

//------------------------------------- FETCH PREFERENCE -------------------------------------

  _onFetchCurrentUserPref(
      FetchCurrentUserPref event, Emitter<ProfileState> emit) async {
    final fetchCurrentUserPreferencesUC =
        serviceLocator<FetchCurrentUserPreferencesUC>();
    final preferences = await fetchCurrentUserPreferencesUC(EmptyParams());
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
  }

//------------------------------------- SAVE PREFERENCE -------------------------------------

  _onAddPreferences(AddPreferences event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final addPreferencesUC = serviceLocator<AddPreferencesUC>();
    final res = await addPreferencesUC(PreferencesParams(
      uid: event.uid,
      ageStart: event.ageStart,
      ageEnd: event.ageEnd,
      heightStart: event.heightStart,
      heightEnd: event.heightEnd,
      maritalStatusPref: event.maritalStatusPref,
      educationPref: event.educationPref,
      jobPref: event.jobPref,
    ));
    res.fold((l) => emit(AddPreferencesFailure(error: l.message)), (r) {
      add(FetchCurrentUserPref());
      emit(AddPreferencesSuccess());
    });
  }

//------------------------------------- EDIT PREFERENCE -------------------------------------

  _onEditPreferences(EditPreferences event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final editPreferencesUC = serviceLocator<EditPreferencesUC>();
    final res = await editPreferencesUC(EditPreferencesParams(
      uid: event.uid,
      ageStart: event.ageStart,
      ageEnd: event.ageEnd,
      heightStart: event.heightStart,
      heightEnd: event.heightEnd,
      maritalStatusPref: event.maritalStatusPref,
      educationPref: event.educationPref,
      jobPref: event.jobPref,
    ));
    res.fold((l) => emit(AddPreferencesFailure(error: l.message)), (r) {
      add(FetchCurrentUserPref());
      emit(AddPreferencesSuccess());
    });
  }
}
