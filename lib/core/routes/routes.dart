import 'package:flutter/material.dart';
import 'package:ishq/features/auth/presentation/pages/auth_selection/scn_auth_selection.dart';
import 'package:ishq/features/auth/presentation/pages/login/scn_login.dart';
import 'package:ishq/features/auth/presentation/pages/signup/scn_signup.dart';
import 'package:ishq/features/auth/presentation/pages/temp.dart';


class Routes {
   static const String temp = '/temp';
  static const String splashScn = '/';
  static const String authSelectionScn = '/authSelectionScn';
  static const String loginScn = '/loginScn';
  static const String signupScn = '/signupScn';
 

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // splashScn: (context) => HomePage(),
      authSelectionScn: (context) => ScnAuthSelection(),
      loginScn: (context) => ScnLogin(),
      signupScn: (context) => ScnSignup(),
      temp: (context) => Temp(),
    };
  }
}