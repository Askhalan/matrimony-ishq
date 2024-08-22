import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/repositories/match_repository_impl.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/categeorize_users_uc.dart';
import 'package:ishq/features/match/domain/usecases/get_all_users.dart';
import 'package:ishq/features/match/domain/usecases/request_usecases/send_request_uc.dart';
import 'package:ishq/features/match/presentation/bloc/match_bloc.dart';

class MatchDependencies {
  static void initMatchData() {
    serviceLocator
      ..registerFactory<MatchDatasource>(
          () => MatchDataSourceImpl(db: serviceLocator(),auth: serviceLocator()))
      ..registerFactory<MatchRepository>(
          () => MatchRepositoryImpl(matchDataSource: serviceLocator()))
      ..registerFactory(() => GetAllUsersUC(matchRepository: serviceLocator()))
      ..registerFactory(
          () => CategorizeUsersUC(matchRepository: serviceLocator()))
      ..registerFactory(() => SendRequestUC(matchRepository: serviceLocator()))
      ..registerLazySingleton(() => MatchBloc(
          getAllUsersUC: serviceLocator(),
          categorizeUsersUC: serviceLocator(),
          sendRequestUC: serviceLocator()));
  }
}
