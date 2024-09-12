import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ishq/app.dart';
import 'package:ishq/core/dependencies/init_dependencies.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';
import 'package:ishq/features/auth/presentation/profile/bloc/profile_bloc.dart';
import 'package:ishq/features/app/presentation/chat/bloc/chat_bloc.dart';
import 'package:ishq/features/app/presentation/match/bloc/match_bloc/match_bloc.dart';
import 'package:ishq/features/app/presentation/match/bloc/request_bloc/request_bloc.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initDependencies();

//---------------- BLOCK PROVIDERS ----------------

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => serviceLocator<AuthBloc>()..add(AuthCheckStatus())),
      BlocProvider(create: (_) => serviceLocator<ProfileBloc>()),
      BlocProvider(create: (_) => serviceLocator<MatchBloc>()),
      BlocProvider(create: (_) => serviceLocator<ChatBloc>()),
      BlocProvider(create: (_) => serviceLocator<RequestBloc>()),
    ],
    child: MyApp(),
  ));
}
