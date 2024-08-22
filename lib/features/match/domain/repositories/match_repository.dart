import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/utils/error/failure.dart';

abstract class MatchRepository {
  Future<Either<Failure, List<UserEntity>>> fetchAllUser();
  Future<Either<Failure, List<UserEntity>>> fetchAgeMatchUsers();
  Future<Either<Failure, List<UserEntity>>> fetchMritalStatusMatchUsers();
  Future<Either<Failure, List<UserEntity>>> fetchJobMatchUsers();

  Future<Either<Failure, Map<String, List<UserEntity>>>> initializeAllMatches();

//------------------------------------ SEND REQUEST-----------------------------------

  Future<Either<Failure, void>> sendRequest(
      {required String requesterId,
      required String requestedId,
      required DateTime timestamp,
      required String status});

  //---------------------------------- ACCEPT REQUEST --------------------------------

  Future<Either<Failure, void>> acceptRequest(String requestId);

  //---------------------------------------------------------------------------------
  Stream<Either<Failure, List<UserEntity>>> getSentRequestsStream();
  Stream<Either<Failure, List<UserEntity>>> getReceivedRequestsStream();
  Stream<Either<Failure, List<UserEntity>>> getAcceptedRequestsStream();

  
}
