// ignore_for_file: avoid_print
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/models/match_request_model.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/features/match/data/repositories/categeorization_helper_fns.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';

class MatchRepositoryImpl implements MatchRepository {
  MatchRepositoryImpl({required this.matchDataSource});
  final MatchDatasource matchDataSource;
  final CategeorizationHelperFns categorizationHelperFns =
      CategeorizationHelperFns();

//---------------------------- FETCH ALL USERS -------------------------------------
  @override
  Future<Either<Failure, List<UserModelMatch>>> fetchAllUser() async {
    try {
      final users = await matchDataSource.getAllUser();
      return right(users);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//---------------------------- CATEGEORIZE USERS -------------------------------------

  @override
  Future<Either<Failure, Map<String, List<UserModelMatch>>>>
      initializeAllMatches() async {
    try {
      // Fetch all users once
      final allUsers = await matchDataSource.getAllUser();

      // Pass the fetched users to the categorization helper functions
      final ageMatches =
          await categorizationHelperFns.fetchAgeMatchUsers(allUsers);
      final maritalStatusMatches =
          await categorizationHelperFns.fetchMritalStatusMatchUsers(allUsers);
      final jobMatches =
          await categorizationHelperFns.fetchJobMatchUsers(allUsers);

      // Initialize a map to store categorized users
      final Map<String, List<UserModelMatch>> categorizedUsers = {};

      categorizedUsers['allUsers'] = allUsers;

      ageMatches.fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['ageMatch'] = users,
      );

      maritalStatusMatches.fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['maritalStatusMatch'] = users,
      );

      jobMatches.fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['jobMatch'] = users,
      );
      
      log('From Repositiry Imp : ${categorizedUsers.length}');
      log('No of datas in allUsers : ${categorizedUsers['allUsers']!.length}');
      log('No of datas in ageMatch : ${categorizedUsers['ageMatch']!.length}');
      log('No of datas in maritalStatusMatch : ${categorizedUsers['maritalStatusMatch']!.length}');
      log('No of datas in jobMatch : ${categorizedUsers['jobMatch']!.length}');
      return right(categorizedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//=============================================================================================================

//---------------------------- Send Request -------------------------------------

  @override
  Future<Either<Failure, void>> sendRequest({
    required String requesterId,
    required String requestedId,
    required DateTime timestamp,
    required String status,
  }) async {
    MatchRequestModel newRequest = MatchRequestModel(
      requesterId: requesterId,
      requestedId: requestedId,
      timestamp: timestamp,
      status: status,
    );

    try {
      await matchDataSource.sendMatchRequest(request: newRequest);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptRequest(String requestId) {
    // TODO: implement acceptRequest
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<UserEntity>>> getAcceptedRequestsStream() {
    // TODO: implement getAcceptedRequestsStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<UserEntity>>> getReceivedRequestsStream() {
    // TODO: implement getReceivedRequestsStream
    throw UnimplementedError();
  }

  @override
  Stream<Either<Failure, List<UserEntity>>> getSentRequestsStream() {
    // TODO: implement getSentRequestsStream
    throw UnimplementedError();
  }
}
