import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

/// Custom Class for Light & Dark Text Themes
class JTextTheme {
  JTextTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: JColor.textPrimary),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: JColor.dark),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: JColor.dark),

    titleLarge: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: JColor.dark),
    titleMedium: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w500, color: JColor.dark),
    titleSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w400, color: JColor.dark),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.dark),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.dark),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.dark.withOpacity(0.5)),

    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: JColor.dark),
    labelMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.dark),
    labelLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal, color: JColor.dark),

  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontSize: 32.0, fontWeight: FontWeight.bold, color: JColor.light),
    headlineMedium: const TextStyle().copyWith(fontSize: 24.0, fontWeight: FontWeight.w600, color: JColor.light),
    headlineSmall: const TextStyle().copyWith(fontSize: 18.0, fontWeight: FontWeight.w600, color: JColor.light),

    titleLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w600, color: JColor.light),
    titleMedium: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w500, color: JColor.light),
    titleSmall: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: JColor.light),

    bodyLarge: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.light),
    bodyMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.light),
    bodySmall: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.w500, color: JColor.light.withOpacity(0.5)),

    labelLarge: const TextStyle().copyWith(fontSize: 16.0, fontWeight: FontWeight.normal, color: JColor.light),
    labelMedium: const TextStyle().copyWith(fontSize: 14.0, fontWeight: FontWeight.normal, color: JColor.light),
    labelSmall: const TextStyle().copyWith(fontSize: 12.0, fontWeight: FontWeight.normal, color: JColor.light),);
}
