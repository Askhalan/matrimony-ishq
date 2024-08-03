import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class SaveUserUsecase implements UseCase<Null, UserDataParams> {
  SaveUserUsecase({required this.profileRepository});
  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, Null>> call(UserDataParams parameters) async {
    return await profileRepository.createUser(
        uid: parameters.uid,
        profileFor: parameters.profileFor,
        name: parameters.name,
        gender: parameters.gender,
        dob: parameters.dob,
        maritalStatus: parameters.maritalStatus,
        email: parameters.email,
        physicalStatus: parameters.physicalStatus,
        phoneNo: parameters.phoneNo,
        country: parameters.country,
        state: parameters.state,
        city: parameters.city,
        bio: parameters.bio,
        profileImage: parameters.profileImage);
  }
}

class UserDataParams {
  final String uid;
  final String profileFor;
  final String name;
  final String gender;
  final String dob;
  final String maritalStatus;
  final String email;
  final String physicalStatus;
  final String phoneNo;
  final String country;
  final String state;
  final String city;
  final String bio;
  final XFile? profileImage;

  UserDataParams(
      {required this.uid,
      required this.profileFor,
      required this.name,
      required this.gender,
      required this.dob,
      required this.maritalStatus,
      required this.email,
      required this.physicalStatus,
      required this.phoneNo,
      required this.country,
      required this.state,
      required this.city,
      required this.bio,
      required this.profileImage});
}
