import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ishq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ishq/features/auth/domain/repositories/auth_repository.dart';
import 'package:ishq/features/auth/domain/usecases/login_usecae.dart';
import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';

class AuthDependencies {
  
  static void initAuth() {
  serviceLocator.registerFactory<AuthRemoteDatasource>(
      () => AuthRemoteDataSourceImpl(authInstance: serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: serviceLocator()));
  serviceLocator.registerFactory(() => UserSignup(serviceLocator()));
    serviceLocator.registerFactory(() => UserLogin(serviceLocator()));

  serviceLocator.registerLazySingleton(() => AuthBloc(
      userSignup:
          serviceLocator(),
          userLogin: serviceLocator())); // Here we are using lazysingleto to maintain the state of block
}
}