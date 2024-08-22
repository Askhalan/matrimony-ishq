// ignore_for_file: avoid_print
import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/core/common/sessions/current_user_prefs.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/models/match_request_model.dart';
import 'package:ishq/features/match/data/models/user_model_match.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/utils/error/failure.dart';
import 'package:ishq/utils/helpers/data_helpers.dart';

class MatchRepositoryImpl implements MatchRepository {
  final MatchDatasource matchDataSource;
  MatchRepositoryImpl({required this.matchDataSource});

  @override
  Future<Either<Failure, List<UserModelMatch>>> fetchAllUser() async {
    try {
      final users = await matchDataSource.getAllUser();
      return right(users);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<UserModelMatch>>>>
      initializeAllMatches() async {
    try {
      // Run all fetching functions in parallel using Future.wait
      final results = await Future.wait([
        fetchAgeMatchUsers(),
        fetchMritalStatusMatchUsers(),
        fetchJobMatchUsers(),
      ]);

      // Initialize a map to store categorized users
      final Map<String, List<UserModelMatch>> categorizedUsers = {};

      // Handle the results for each category
      results[0].fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['ageMatch'] = users,
      );

      results[1].fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['maritalStatusMatch'] = users,
      );

      results[2].fold(
        (failure) => throw Exception(failure.message),
        (users) => categorizedUsers['jobMatch'] = users,
      );

      return right(categorizedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
//=============================================================================================================

//--------------------------------- Age Based Categeorization -------------------------------------

  @override
  Future<Either<Failure, List<UserModelMatch>>> fetchAgeMatchUsers() async {
    try {
      final users = await matchDataSource.getAllUser();
      final List<UserModelMatch> ageMachedUsers = [];
      //----- Implementing categorization logics
      for (final user in users) {
        if (int.parse(user.dob) >=
                DataHelper.safeParseInt(CurrentUserPreferences().ageStart,
                    defaultValue: 18) &&
            int.parse(user.dob) <
                DataHelper.safeParseInt(CurrentUserPreferences().ageEnd,
                    defaultValue: 60)) {
          ageMachedUsers.add(user);
        }
      }
      return right(ageMachedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//---------------------------- Marital Status Based Categeorization -------------------------------------

  @override
  Future<Either<Failure, List<UserModelMatch>>>
      fetchMritalStatusMatchUsers() async {
    try {
      final users = await matchDataSource.getAllUser();
      final List<UserModelMatch> maritalStatusMachedUsers = [];
      //----- Implementing categorization logics
      if (CurrentUserPreferences().maritalStatusPref == null) {
        maritalStatusMachedUsers.addAll(users);
      } else {
        for (final user in users) {
          if (CurrentUserPreferences()
              .maritalStatusPref!
              .contains(user.maritalStatus)) {
            maritalStatusMachedUsers.add(user);
          }
        }
      }

      return right(maritalStatusMachedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//---------------------------- Job Based Categeorization -------------------------------------

  @override
  Future<Either<Failure, List<UserModelMatch>>> fetchJobMatchUsers() async {
    try {
      final users = await matchDataSource.getAllUser();
      final List<UserModelMatch> jobMachedUsers = [];
      //----- Implementing categorization logics
      if (CurrentUserPreferences().jobPref == null) {
        jobMachedUsers.addAll(users);
      } else {
        for (final user in users) {
          if (CurrentUserPreferences().jobPref!.contains(user.maritalStatus)) {
            jobMachedUsers.add(user);
          }
        }
      }

      return right(jobMachedUsers);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

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
