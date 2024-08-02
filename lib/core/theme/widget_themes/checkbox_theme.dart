import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';


class JCheckboxTheme {
  JCheckboxTheme._(); // To avoid creating instances

// +++++++---------------------------- LIGHT THEME ----------------------------+++++++

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return JColor.white;
      } else {
        return JColor.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return JColor.secondary;
      } else {
        return Colors.transparent;
      }
    }),
  );

// +++++++---------------------------- LIGHT THEME ----------------------------+++++++

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(JSize.xs)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return JColor.white;
      } else {
        return JColor.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return JColor.secondary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
