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
import 'package:ishq/features/auth/domain/usecases/add_preferences.dart';
import 'package:ishq/features/auth/domain/usecases/caches/check_login.dart';
import 'package:ishq/features/auth/domain/usecases/caches/remove_session_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/caches/set_login_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/fetch_current_user.dart';
import 'package:ishq/features/auth/domain/usecases/login_usecae.dart';
import 'package:ishq/features/auth/domain/usecases/logout_usecase.dart';
import 'package:ishq/features/auth/domain/usecases/save_user_data.dart';
import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';

class AuthDependencies {
  static void initUserPref() {
    serviceLocator
      ..registerLazySingleton<LocalPrefDatasource>(
          () => LocalPreferenceDatasourceImpl(preference: serviceLocator()))
      ..registerLazySingleton<UserSessionRepository>(() =>
          UserSessionRepositoryImpl(localPrefDatasource: serviceLocator()))
      ..registerLazySingleton(
          () => CheckLogin(userSessionRepository: serviceLocator()))
      ..registerLazySingleton(
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
      ..registerFactory(() => RemoveSessionUC(serviceLocator()))
      ..registerFactory(() => LogoutUC(serviceLocator()))
      ..registerLazySingleton(() => AuthBloc(
          userSignup: serviceLocator(),
          userLogin: serviceLocator(),
          fetchCurrentUser: serviceLocator(),
          checkLoginUsecse: serviceLocator(),
          setLoginUsecase: serviceLocator(),
          logoutUsecase: serviceLocator(),
          removeSessionUC: serviceLocator()));
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
      ..registerFactory(
          () => AddPreferencesUC(profileRepository: serviceLocator()))
      ..registerLazySingleton(() => ProfileBloc(
          saveUser: serviceLocator(),
          fetchCurrentUser: serviceLocator(),
          setLoginUsecase: serviceLocator(),
          addPreferenceUC: serviceLocator()));
  }
}
