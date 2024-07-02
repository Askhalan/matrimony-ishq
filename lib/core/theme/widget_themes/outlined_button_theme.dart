
import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';


/* -- Light & Dark Outlined Button Themes -- */
class JOutlinedButtonTheme {
  JOutlinedButtonTheme._(); //To avoid creating instances


  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme  = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: JColor.dark,
      side: const BorderSide(color: JColor.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: JColor.black, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: JColor.light,
      side: const BorderSide(color: JColor.borderPrimary),
      textStyle: const TextStyle(fontSize: 16, color: JColor.textWhite, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
    ),
  );
}
