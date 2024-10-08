import 'package:flutter/material.dart';
import 'package:ishq/core/routes/navigation_menu.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/auth_selection/screen_redirect.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/family_details/scn_family_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/image_details.dart/add_profile_image.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/address_details/address_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/career_details/scn_professional_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/edit_profile/widgets/forms/edit_basic_details/edit_basic_details.dart';
import 'package:ishq/features/auth/presentation/profile/pages/edit_profile/widgets/forms/edit_profile_image.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/scn_add_preference.dart';
import 'package:ishq/features/auth/presentation/profile/pages/preferance/scn_edit_preference.dart';
import 'package:ishq/features/auth/presentation/profile/pages/edit_profile/scn_edit_profile.dart';
import 'package:ishq/features/auth/presentation/profile/pages/profile/scn_profile.dart';
import 'package:ishq/features/auth/presentation/profile/pages/settings/settings.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/auth_selection/scn_auth_selection.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/login/scn_login.dart';
import 'package:ishq/features/auth/presentation/authentication/pages/signup/scn_signup.dart';
import 'package:ishq/features/auth/presentation/profile/pages/add_details/basic_details/basic_details.dart';

class Routes {
  static const String screenRedirect = 'screenRedirect';
  static const String authSelectionScn = '/authSelectionScn';
  static const String loginScn = '/loginScn';
  static const String signupScn = '/signupScn';
  static const String basicDetailsScn = '/basicDetailsScn';
  static const String addProfessionalDetailsScn = '/addProfessionalDetailsScn';
  static const String addFamilyDetailsScn = '/addFamilyDetailsScn';
  static const String addressDetailsScn = '/addressDetailsScn';
  static const String navigationMenu = '/navigationMenu';
  static const String profileScn = '/profileScn';
  static const String editProfileScn = '/editProfileScn';
  static const String settingsScn = '/settingsScn';
  static const String addPreferenceScn = '/addPreferenceScn';
  static const String editPreferenceScn = '/editPreferenceScn';
  static const String addProfileImgScn = '/addProfileImgScn';
  //--------------- Edit ---------------
  static const String editProfileImgScn = '/editProfileImgScn';
  static const String editBasicDetailsScn = '/editBasicDetailsScn';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      screenRedirect: (context) => ScreenRedirect(),
      authSelectionScn: (context) => ScnAuthSelection(),
      loginScn: (context) => ScnLogin(),
      signupScn: (context) => ScnSignup(),
      basicDetailsScn: (context) => ScnBasicDetails(),
      addProfessionalDetailsScn: (context) => ScnProfessionalDetails(),
      addressDetailsScn: (context) => ScnAddressDetails(),
      addFamilyDetailsScn: (context) => ScnFamilyDetails(),
      navigationMenu: (context) => NavigationMenu(),
      profileScn: (context) => ScnProfile(),
      editProfileScn: (context) => ScnEditProfile(),
      settingsScn: (context) => ScnSettings(),
      addPreferenceScn: (context) => ScnAddPreference(),
      editPreferenceScn: (context) => ScnEditPreference(),
      addProfileImgScn: (context) => ScnAddProfileImg(),
      //--------------- Edit ---------------
      editProfileImgScn: (context) => ScnEditProfileImg(),
      editBasicDetailsScn: (context) => ScnEditBasicDetails(),
    };
  }
}
