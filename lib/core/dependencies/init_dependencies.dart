import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ishq/core/dependencies/auth_dependencies.dart';
import 'package:ishq/firebase_options.dart';

final serviceLocator = GetIt.instance;

final getStorage = GetStorage();
Future<void> initDependencies() async {
  await GetStorage.init(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  serviceLocator.registerLazySingleton(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton(() => FirebaseFirestore.instance);
  serviceLocator.registerLazySingleton(()=> getStorage );
  //-----------------------------------------------------------------------------
  
  AuthDependencies.initUserPref();
  AuthDependencies.initAuth();
  AuthDependencies.initProfile();
  
}
