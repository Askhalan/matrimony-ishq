// ignore_for_file: override_on_non_overriding_member

import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';

// class MatchAgeUC implements UseCase<List<UserEntity>, EmptyParams> {
//   final MatchRepository matchRepository;

//   MatchAgeUC({required this.matchRepository});
//   @override
//   Future<Either<Failure, List<UserEntity>>> call(parameters) async {
//     return await matchRepository.fetchAgeMatchUsers();
//   }
// }
class MatchAgeUC {
  final MatchRepository matchRepository;

  MatchAgeUC({required this.matchRepository});
  @override
  Future<List<UserEntity>> call(parameters) async {
    return await matchRepository.fetchAgeMatchUsers();
  }
}
