
import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';

import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_theme.dart';

class JAppTheme {
  JAppTheme._();

// +++++++---------------------------- LIGHT THEME ----------------------------+++++++

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: JColor.grey,
    brightness: Brightness.light,
    primaryColor: JColor.primary,
    textTheme: JTextTheme.lightTextTheme,
    chipTheme: JChipTheme.lightChipTheme,
    scaffoldBackgroundColor: JColor.white,
    appBarTheme: JAppBarTheme.lightAppBarTheme,
    checkboxTheme: JCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: JBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: JElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.lightInputDecorationTheme,
  );

// +++++++----------------------------- DARK THEME -----------------------------+++++++

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: JColor.grey,
    brightness: Brightness.dark,
    primaryColor: JColor.primary,
    textTheme: JTextTheme.darkTextTheme,
    chipTheme: JChipTheme.darkChipTheme,
    scaffoldBackgroundColor: JColor.black,
    appBarTheme: JAppBarTheme.darkAppBarTheme,
    checkboxTheme: JCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: JBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: JElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: JOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: JTextFormFieldTheme.darkInputDecorationTheme,
  );
}
