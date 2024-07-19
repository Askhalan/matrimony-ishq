// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data_usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SaveUserUsecase _saveUserUsecase;

  ProfileBloc({required SaveUserUsecase saveUser})
      : _saveUserUsecase = saveUser,
        super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<SaveUser>(_onSaveUser);
  }

  void _onSaveUser(SaveUser event, Emitter<ProfileState> emit) async {
    final res = await _saveUserUsecase(UserDataParams(
        profileFor: event.profileFor,
        name: event.name,
        gender: event.gender,
        dob: event.dob,
        maritalStatus: event.maritalStatus,
        email: event.email,
        physicalStatus: event.physicalStatus,
        phoneNo: event.phoneNo,
        country: event.country,
        state: event.state,
        city: event.city,
        bio: event.bio,
        profileImage: event.profileImage));

    res.fold((l) => emit(ProfileFailure(error: l.message)),
        (r) => emit(ProfileSuccess()));
  }
}
