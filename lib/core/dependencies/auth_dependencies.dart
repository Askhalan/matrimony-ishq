import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ishq/features/auth/data/datasources/local_preference_datasource.dart';
import 'package:ishq/features/auth/data/datasources/profile_remote_datasource.dart';
import 'package:ishq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ishq/features/auth/data/repositories/profile_repository_impl.dart';
import 'package:ishq/features/auth/data/repositories/user_sesion_repository_impl.dart';
import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
import 'package:ishq/features/auth/domain/repositories/profile_repository.dart';
import 'package:ishq/features/auth/domain/repositories/user_session_repository.dart';
import 'package:ishq/features/auth/domain/usecases/caches/check_login.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/login_usecae.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';

class AuthDependencies {
  static void initUserPref() {
    serviceLocator
      ..registerFactory<LocalPrefDatasource>(
          () => LocalPreferenceDatasourceImpl(preference: serviceLocator()))
      ..registerFactory<UserSessionRepository>(() =>
          UserSessionRepositoryImpl(localPrefDatasource: serviceLocator()))
      ..registerFactory(
          () => CheckLogin(userSessionRepository: serviceLocator()))
      ..registerFactory(
          () => SetLogin(userSessionRepository: serviceLocator()));
  }

  static void initAuth() {
    serviceLocator
      ..registerFactory<AuthRemoteDatasource>(
          () => AuthRemoteDataSourceImpl(authInstance: serviceLocator()))
      ..registerFactory<AuthRepository>(
          () => AuthRepositoryImpl(remoteDataSource: serviceLocator()))
      ..registerFactory(() => UserSignup(serviceLocator()))
      ..registerFactory(() => UserLogin(serviceLocator()))
      ..registerLazySingleton(() => AuthBloc(
          userSignup: serviceLocator(),
          userLogin: serviceLocator(),
          fetchCurrentUser: serviceLocator(),
          checkLoginUsecse: serviceLocator(),
          setLoginUsecase: serviceLocator()));
    // Here we are using lazysingleto to maintain the state of block
  }

  static void initProfile() {
    serviceLocator
      ..registerFactory<ProfileRemoteDatasource>(() =>
          ProfileRemoteDatasourceImpl(
              db: serviceLocator(), auth: serviceLocator()))
      ..registerFactory<ProfileRepository>(
          () => ProfileRepositoryImpl(profileDataSource: serviceLocator()))
      ..registerFactory(
          () => SaveUserUsecase(profileRepository: serviceLocator()))
      ..registerFactory(
          () => FetchCurrentUserUsecase(profileRepository: serviceLocator()))
      ..registerLazySingleton(() => ProfileBloc(
          saveUser: serviceLocator(),
          fetchCurrentUser: serviceLocator(),
          setLoginUsecase: serviceLocator()));
  }
}
