// ignore_for_file: override_on_non_overriding_member

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/usecase/empty_params.dart';
import 'package:ishq/core/common/usecase/usecase.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class MatchAgeUC implements UseCase<List<UserEntity>, EmptyParams> {
  final MatchRepository matchRepository;

  MatchAgeUC({required this.matchRepository});
  @override
  Future<Either<Failure, List<UserEntity>>> call(parameters) async {
    return await matchRepository.fetchAgeMatchUsers();
  }
}

