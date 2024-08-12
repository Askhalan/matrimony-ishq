import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/core/common/entities/pref_entity.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class ProfileRepository {
  //---------------- Save New User Data ----------------
  Future<Either<Failure, Null>> createUser({
    String? uid,
    required String profileFor,
    required String name,
    required String gender,
    required String dob,
    required String maritalStatus,
    required String email,
    required String physicalStatus,
    required String phoneNo,
    required String country,
    required String state,
    required String city,
    required String bio,
    required String education,
    required String college,
    required String employedIn,
    required String occupation,
    required String organization,
    required String familyValues,
    required String familyStatus,
    required String familyType,
    required String familyAbout,
    required XFile? profileImage,
  });

  //-------------- Fetch Current User Data -------------

  Future<Either<Failure, UserEntity>> fetchCurrentUser();

  //---------------- Add User Presference --------------

  Future<Either<Failure, Null>> addUserPreference(
      {String? uid,
      required String ageStart,
      required String ageEnd,
      required String heightStart,
      required String heightEnd,
      required List<dynamic> maritalStatusPref,
      required List<dynamic> educationPref,
      required List<dynamic> jobPref});

  //-------------- Fetch Current User Data -------------

  Future<Either<Failure, PrefEntity>> fetchCurrentUserPreferences();
}
