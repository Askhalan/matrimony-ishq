import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/match/data/datasources/match_datasource.dart';
import 'package:ishq/features/match/data/repositories/match_repository_impl.dart';
import 'package:ishq/features/match/domain/repositories/match_repository.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/age_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/categeory_usecases/marital_status_match_uc.dart';
import 'package:ishq/features/match/domain/usecases/get_all_users.dart';
import 'package:ishq/features/match/presentation/bloc/match_bloc.dart';

class MatchDependencies {
  static void initMatchData() {
    serviceLocator
      ..registerFactory<MatchDatasource>(
          () => MatchDataSourceImpl(db: serviceLocator()))
      ..registerFactory<MatchRepository>(
          () => MatchRepositoryImpl(matchDataSource: serviceLocator()))
      ..registerFactory(() => GetAllUsersUC(matchRepository: serviceLocator()))
      ..registerFactory(() => MatchAgeUC(matchRepository: serviceLocator()))
      ..registerFactory(
          () => MatchMaritalStatusUC(matchRepository: serviceLocator()))
      ..registerLazySingleton(() => MatchBloc(
            getAllUsersUC: serviceLocator(),
            matchAgeUC: serviceLocator(),
            matchMaritalStatusUC: serviceLocator(),
          ));
  }
}
