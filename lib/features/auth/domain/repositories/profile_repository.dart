import 'package:fpdart/fpdart.dart';
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
    required String? profileImage,
  });

  //-------------- Fetch Current User Data -------------

  Future<Either<Failure, UserEntity>> fetchCurrentUser();


}
