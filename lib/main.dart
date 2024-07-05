// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/app.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await initDependencies();

//---------------- BLOCK PROVIDERS ----------------

  runApp(
    MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()),
    ],
    child: MyApp(),
  ));
}

