import 'package:flutter/material.dart';
import 'package:ishq/features/auth/presentation/pages/login/scn_login.dart';
import 'package:ishq/features/auth/presentation/pages/signup/scn_signup.dart';
import 'package:ishq/features/auth/presentation/pages/temp.dart';


class Routes {
  static const String splashScn = '/';
  static const String loginScn = '/loginScn';
  static const String signupScn = '/signupScn';
  static const String temp = '/temp';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // splashScn: (context) => HomePage(),
      loginScn: (context) => ScnLogin(),
      signupScn: (context) => ScnSignup(),
      temp: (context) => Temp(),
    };
  }
}