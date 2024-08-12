

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/pref_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class FetchCurrentUserPreferencesUC implements UseCase<PrefEntity,EmptyParams>{
  FetchCurrentUserPreferencesUC({required this.profileRepository});
  final ProfileRepository profileRepository;

  
  @override
  Future<Either<Failure, PrefEntity>> call(EmptyParams parameters)async {

   return await profileRepository.fetchCurrentUserPreferences();
  }

}

