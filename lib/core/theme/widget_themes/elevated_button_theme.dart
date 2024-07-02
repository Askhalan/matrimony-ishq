import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class JElevatedButtonTheme {
  JElevatedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
static final lightElevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: JColor.light,
    backgroundColor: JColor.primary,
    disabledForegroundColor: JColor.darkGrey,
    disabledBackgroundColor: JColor.buttonDisabled,
    side: const BorderSide(color: JColor.primary),
    padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight),
    textStyle: const TextStyle(fontSize: 16, color: JColor.primary, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
    minimumSize: const Size.fromHeight(50), // Ensure the button has a minimum height
    maximumSize: Size(double.infinity, 50), // Ensure the button can expand to fill the width
  ).copyWith(
    fixedSize: WidgetStateProperty.all<Size>(Size(double.infinity, 50)),
  ),
);

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColor.light,
      backgroundColor: JColor.primary,
      disabledForegroundColor: JColor.darkGrey,
      disabledBackgroundColor: JColor.darkerGrey,
      side: const BorderSide(color: JColor.primary),
      padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight,),
      textStyle: const TextStyle(fontSize: 16, color: JColor.textPrimary, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.inputFieldRadiusXl)),
      minimumSize: const Size.fromHeight(50), // Ensure the button has a minimum height
    maximumSize: Size(double.infinity, 50), // Ensure the button can expand to fill the width
  ).copyWith(
    fixedSize: WidgetStateProperty.all<Size>(Size(double.infinity, 50)),
  ),
  );
}
