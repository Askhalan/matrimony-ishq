// ignore_for_file: avoid_print

import 'package:fpdart/fpdart.dart';
import 'package:ishq/core/common/entities/user_entity.dart';
import 'package:ishq/features/app/data/datasources/request_datasource.dart';
import 'package:ishq/features/app/data/models/match_request_model.dart';
import 'package:ishq/features/app/data/repositories/categeorization_helper_fns.dart';
import 'package:ishq/features/app/domain/repositories/request_repository%20copy.dart';
import 'package:ishq/utils/error/failure.dart';

class RequestRepositoryImpl implements RequestRepository {
  RequestRepositoryImpl({required this.requestDatasource});
  final RequestDatasource requestDatasource;
  final CategeorizationHelperFns categorizationHelperFns =
      CategeorizationHelperFns();

//--------------------------------------- Send Request ---------------------------------------

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
      requestedUserDetails: null,
    );

    try {
      await requestDatasource.sendMatchRequest(request: newRequest);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//-------------------------------------- Accept Request --------------------------------------

  @override
  Future<Either<Failure, void>> acceptRequest(String requestedUserUid) async {
    try {
      await requestDatasource.acceptMatchRequest(requestedUserUid);
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//----------------------------------- Get Recived Request ------------------------------------

  @override
  Stream<Either<Failure, List<UserEntity>>> getReceivedRequestsStream() async* {
    try {
      yield* requestDatasource.getReceivedRequestsStream().map(
        (userList) {
          return right(userList);
        },
      );
    } catch (e) {
      yield left(Failure(e.toString()));
    }
  }

//------------------------------------- Get Sent Request -------------------------------------

  @override
  Stream<Either<Failure, List<UserEntity>>> getSentRequestsStream() async* {
    try {
      yield* requestDatasource.getSentRequestsStream().map(
        (userList) {
          return right(userList);
        },
      );
    } catch (e) {
      yield left(Failure(e.toString()));
    }
  }
//----------------------------------- Get Accepted Request -----------------------------------

  @override
  Stream<Either<Failure, List<UserEntity>>> getAcceptedRequestsStream() async* {
    try {
      yield* requestDatasource.getAcceptedRequestsStream().map(
        (userList) {
          return right(userList);
        },
      );
    } catch (e) {
      yield left(Failure(e.toString()));
    }
  }
}
