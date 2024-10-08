
import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class FetchCurrentUserUC implements UseCase<UserEntity,EmptyParams>{
  FetchCurrentUserUC({required this.profileRepository});
  final ProfileRepository profileRepository;

  
  @override
  Future<Either<Failure, UserEntity>> call(EmptyParams parameters)async {
   return await profileRepository.fetchCurrentUser();
  }

}


