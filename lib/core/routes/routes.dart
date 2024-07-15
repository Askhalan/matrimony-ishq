import 'package:flutter/material.dart';
import 'package:ishq/core/routes/navigation_menu.dart';
import 'package:ishq/features/Profile/presentation/pages/profile/scn_profile.dart';
import 'package:ishq/features/Profile/presentation/pages/signup_details/address_details.dart';
import 'package:ishq/features/Profile/presentation/pages/signup_details/basic_details.dart';

import 'package:ishq/features/auth/presentation/pages/auth_selection/scn_auth_selection.dart';
import 'package:ishq/features/auth/presentation/pages/login/scn_login.dart';
import 'package:ishq/features/auth/presentation/pages/signup/scn_signup.dart';
import 'package:ishq/features/auth/presentation/pages/temp.dart';

class Routes {

  static const String splashScn = '/';
  static const String authSelectionScn = '/authSelectionScn';
  static const String loginScn = '/loginScn';
  static const String signupScn = '/signupScn';
  static const String basicDetailsScn = '/basicDetailsScn';
  static const String addressDetailsScn = '/addressDetailsScn';
  static const String navigationMenu = '/navigationMenu';
  static const String profileScn = '/profileScn';


  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // splashScn: (context) => HomePage(),
      authSelectionScn: (context) => ScnAuthSelection(),
      loginScn: (context) => ScnLogin(),
      signupScn: (context) => ScnSignup(),
      basicDetailsScn: (context) => ScnBasicDetails(),
      addressDetailsScn: (context) => ScnAddressDetails(),
      navigationMenu: (context) => NavigationMenu(),
      profileScn: (context) => ScnProfile(),


    };
  }
}
