import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<UserEntity>>> fetchAllUser();
}
