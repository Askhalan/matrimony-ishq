import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class CategorizeUsersUC implements UseCase<Map<String, List<UserEntity>>, EmptyParams> {
  final MatchRepository matchRepository;

  CategorizeUsersUC({required this.matchRepository});

  @override
  Future<Either<Failure, Map<String, List<UserEntity>>>> call(EmptyParams params) async {
    return await matchRepository.initializeAllMatches();
  }
}