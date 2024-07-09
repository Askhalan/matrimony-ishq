
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
    foregroundColor: JColor.light,
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
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
     elevation: 0,
    // foregroundColor: JColor.light,
    // disabledForegroundColor: JColor.darkGrey,
    // disabledBackgroundColor: JColor.buttonDisabled,
    // side: const BorderSide(color: JColor.primary),
    padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight),
    // textStyle: const TextStyle(fontSize: 16, color: JColor.primary, fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
    minimumSize: const Size.fromHeight(50), // Ensure the button has a minimum height
    maximumSize: Size(double.infinity, 50), // Ensure the button can expand to fill the width
  ).copyWith(
    fixedSize: WidgetStateProperty.all<Size>(Size(double.infinity, 50)),
  ),
  );
}



//  style: OutlinedButton.styleFrom(
//       foregroundColor: JColor.light,
//       side: const BorderSide(color: JColor.borderPrimary),
//       textStyle: const TextStyle(fontSize: 16, color: JColor.textWhite, fontWeight: FontWeight.w600),
//       padding: const EdgeInsets.symmetric(vertical: JSize.buttonHeight, horizontal: 20),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.buttonRadius)),
//     ),