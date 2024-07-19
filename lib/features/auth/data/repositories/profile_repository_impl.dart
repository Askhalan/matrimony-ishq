import 'package:fpdart/fpdart.dart';
import 'package:ishq/features/auth/data/datasources/profile_remote_datasource.dart';
import 'package:ishq/features/auth/data/models/user_model.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.profileDataSource});

  final ProfileRemoteDatasource profileDataSource;

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
      required String? profileImage}) async {
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
          profileImage: profileImage);

      //--- Now svaing the record using fn from DataSource
      await profileDataSource.saveUserRecord(user: newUser);

      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //-------------
}
