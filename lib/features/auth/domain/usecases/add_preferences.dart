import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class AddPreferencesUC implements UseCase<Null, PreferencesParams> {
  AddPreferencesUC({required this.profileRepository});
  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, Null>> call(PreferencesParams parameters) async {
    return await profileRepository.addUserPreference(
      uid: parameters.uid,
      ageStart: parameters.ageStart,
      ageEnd: parameters.ageEnd,
      heightStart: parameters.heightStart,
      heightEnd: parameters.heightEnd,
      maritalStatusPref: parameters.maritalStatusPref,
      educationPref: parameters.educationPref,
      jobPref: parameters.jobPref,
    );
  }
}

class PreferencesParams {
  final String? uid;
  final String ageStart;
  final String ageEnd;
  final String heightStart;
  final String heightEnd;
  final List<dynamic> maritalStatusPref;
  final List<dynamic> educationPref;
  final List<dynamic> jobPref;

  PreferencesParams(
      {required this.uid,
      required this.ageStart,
      required this.ageEnd,
      required this.heightStart,
      required this.heightEnd,
      required this.maritalStatusPref,
      required this.educationPref,
      required this.jobPref});
}
