
import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class GetAllUsersUC implements UseCase<List<UserEntity> ,EmptyParams> {
  final MatchRepository matchRepository;

  GetAllUsersUC({required this.matchRepository});
  @override
  Future<Either<Failure, List<UserEntity>>> call(parameters) async {
    return await matchRepository.fetchAllUser();
  }

}
