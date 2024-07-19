import 'package:fpdart/fpdart.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class ProfileRepository {
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
}
