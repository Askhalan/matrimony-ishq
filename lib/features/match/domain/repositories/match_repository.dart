import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<UserEntity>>> fetchAllUser();

  Future<Either<Failure, Map<String, List<UserEntity>>>> fetchAndCategorizeUsers();

  Future<Either<Failure, List<UserEntity>>> fetchAgeMatchUsers();
  Future<Either<Failure, List<UserEntity>>> fetchMritalStatusMatchUsers();
  // Future<Either<Failure, List<UserEntity>>> fetchProfessionalMatchUsers();


}
