import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/app/data/datasources/match_datasource.dart';
import 'package:ishq/features/app/data/datasources/request_datasource.dart';
import 'package:ishq/features/app/data/repositories/match_repository_impl.dart';
import 'package:ishq/features/app/data/repositories/request_repository.dart';
import 'package:ishq/features/app/domain/repositories/match_repository.dart';
import 'package:ishq/features/app/domain/repositories/request_repository%20copy.dart';
import 'package:ishq/features/app/domain/usecases/match_usecases/categeorize_users_uc.dart';
import 'package:ishq/features/app/domain/usecases/match_usecases/get_all_users.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/accept_request_uc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_accepted_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_received_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/get_sent_request_suc.dart';
import 'package:ishq/features/app/domain/usecases/request_usecases/send_request_uc.dart';
import 'package:ishq/features/app/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/app/presentation/match/bloc/request_bloc/request_bloc.dart';

class MatchDependencies {
  static void initMatchData() {
    serviceLocator
      ..registerFactory<MatchDatasource>(() =>
          MatchDataSourceImpl(db: serviceLocator(), auth: serviceLocator()))
      ..registerFactory<RequestDatasource>(() =>
          RequestDataSourceImpl(db: serviceLocator(), auth: serviceLocator()))

//-------------------------------------------------------------------------------------------

      ..registerFactory<MatchRepository>(
          () => MatchRepositoryImpl(matchDataSource: serviceLocator()))
      ..registerFactory<RequestRepository>(
          () => RequestRepositoryImpl(requestDatasource: serviceLocator()))

//-------------------------------------------------------------------------------------------

      ..registerFactory(() => GetAllUsersUC(matchRepository: serviceLocator()))
      ..registerFactory(
          () => CategorizeUsersUC(matchRepository: serviceLocator()))
      ..registerFactory(
          () => SendRequestUC(requestRepository: serviceLocator()))
      ..registerFactory(
          () => AcceptRequestUC(requestRepository: serviceLocator()))
      ..registerFactory(() =>
          GetAcceptedRequestsStreamUC(requestRepository: serviceLocator()))
      ..registerFactory(() =>
          GetReceivedRequestsStreamUC(requestRepository: serviceLocator()))
      ..registerFactory(
          () => GetSentRequestsStreamUC(requestRepository: serviceLocator()))

//-------------------------------------------------------------------------------------------
      ..registerLazySingleton(() => MatchBloc())
      ..registerLazySingleton(() => RequestBloc());
  }
}
