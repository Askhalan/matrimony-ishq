

import 'package:flutter/material.dart';

class JColor {
  JColor._();

// ===================================Project-Specific-Colours======================================

  // App Basic Colors
  static const Color primary =Color(0xFF953966);
  static const Color secondary = Color.fromARGB(113, 149, 57, 101);
  static const Color accent =Color(0xFF4F0618);

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color bg = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFFFFFFF);

  // Icon Color
  static const Color icon = Color(0xFF797979);
  static const Color iconAccent = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color.fromARGB(255, 24, 25, 32);
  static const Color textSecondary = Color(0xFFFFFFFF);
  static const Color textWhite = Colors.white;

  // Button colors
  static const Color buttonPrimary =Color(0xFFFFFFFF);
  static const Color buttonSecondary = Color(0xFFFFFFFF);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

// ======================================Constant-Colors===========================================

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color.fromARGB(255, 255, 77, 77);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}



// ======================================Gradient Colors===========================================

 const Gradient gradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color(0xFFFF8383),
      Color(0xFFFFC5E1),
    ],
  );
  const Gradient gradientBgTile = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromARGB(255, 248, 186, 111),
      Color.fromARGB(255, 255, 181, 62),
      Color.fromARGB(255, 255, 207, 147),
    ],
  );