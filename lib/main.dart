// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/theme/theme.dart';

import 'package:ishq/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ishq/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ishq/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/pages/signup/scn_signup.dart';
import 'package:ishq/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => AuthBloc(
          userSignup: UserSignup(
            AuthRepositoryImpl(
              remoteDataSource: AuthRemoteDataSourceImpl(
                authInstance: FirebaseAuth.instance,
              ),
            ),
          ),
        ),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ishq Matrimony',
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      home: ScnSignup(),
    );
  }
}
