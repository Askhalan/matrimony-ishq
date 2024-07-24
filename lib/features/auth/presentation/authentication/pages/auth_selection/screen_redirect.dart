import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishq/core/routes/routes.dart';
import 'package:ishq/features/auth/presentation/authentication/bloc/auth_bloc.dart';

class ScreenRedirect extends StatelessWidget {
  const ScreenRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if(state is AuthUnauthenticated){
          Navigator.pushReplacementNamed(context, Routes.authSelectionScn);
        }
         if(state is AuthAuthenticated){
          Navigator.pushReplacementNamed(context, Routes.navigationMenu);
        }
      },
      child: SizedBox(),
    );
  }
}
