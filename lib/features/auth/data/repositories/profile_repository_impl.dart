import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ishq/features/auth/data/datasources/profile_remote_datasource.dart';
import 'package:ishq/features/auth/data/models/pref_model.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileDataSource});

  final ProfileRemoteDatasource profileDataSource;

//==================================================================================================================

  @override
  Future<Either<Failure, Null>> createUser(
      {String? uid,
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
      required XFile? profileImage}) async {
    try {
      //--- Create a new UserModel class
      UserModel newUser = UserModel(
          uid: uid,
          profileFor: profileFor,
          name: name,
          gender: gender,
          dob: dob,
          maritalStatus: maritalStatus,
          email: email,
          physicalStatus: physicalStatus,
          phoneNo: phoneNo,
          country: country,
          state: state,
          city: city,
          bio: bio,
          profileImage: '');

      //--- Now svaing the record using fn from DataSource
      await profileDataSource.saveUserRecord(user: newUser);

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//==================================================================================================================

  @override
  Future<Either<Failure, UserModel>> fetchCurrentUser() async {
    try {
      final res = await profileDataSource.fetchCurrentUser();
      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Null>> addUserPreference(
      {String? uid,
      required String ageStart,
      required String ageEnd,
      required String heightStart,
      required String heightEnd,
      required List<String> maritalStatusPref,
      required List<String> educationPref,
      required List<String> jobPref}) async {
    try {
      PrefModel preferences = PrefModel(
        uid: uid,
        ageStart: ageStart,
        ageEnd: ageEnd,
        heightStart: heightStart,
        heightEnd: heightEnd,
        maritalStatusPref: maritalStatusPref,
        educationPref: educationPref,
        jobPref: jobPref,
      );
      await profileDataSource.addPreference(preferences: preferences);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
