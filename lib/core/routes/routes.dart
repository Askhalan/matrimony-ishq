import 'package:flutter/material.dart';
import 'package:ishq/core/routes/navigation_menu.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/scn_profile.dart';
import 'package:ishq/features/auth/presentation/profile/pages/settings/settings.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/auth_selection/scn_auth_selection.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/login/scn_login.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/signup/scn_signup.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/basic_details.dart';

import '../../features/auth/presentation/profile/pages/add_details/address_details.dart';

class Routes {

  static const String splashScn = '/';
  static const String authSelectionScn = '/authSelectionScn';
  static const String loginScn = '/loginScn';
  static const String signupScn = '/signupScn';
  static const String basicDetailsScn = '/basicDetailsScn';
  static const String addressDetailsScn = '/addressDetailsScn';
  static const String navigationMenu = '/navigationMenu';
  static const String profileScn = '/profileScn';
  static const String settingsScn = '/settingsScn';


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
      settingsScn: (context) => ScnSettings(),


    };
  }
}
