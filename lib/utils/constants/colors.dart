import 'package:flutter/material.dart';

class JColor {
  JColor._();

  

// ===================================Project-Specific-Colours======================================

  // App Basic Colors
  static const Color primary = Color(0xFF953966);
  static const Color secondary = Color(0xFFD897B9);
  static const Color accent = Color(0xFF4F0618);


  //------------------- GADIENTS -------------------

  static const Gradient gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 108, 43, 74),
      primary,
    ],
  );
  static const Gradient premiumProfilegGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFF673BDE),
      Color(0xFF9F62F0),
      Color(0xFF9F62F0),
      Color(0xFF673BDE),
    ],
  );
  static const Gradient goldGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [
      Color(0xFFC69338),
      Color(0xFFFEF18B),
      Color(0xFFFEF18B),
      Color(0xFFC69338),
    ],
  );

  static const Gradient blackGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Color.fromARGB(255, 43, 43, 43),
      Color.fromARGB(200, 43, 43, 43),
      Color.fromARGB(150, 43, 43, 43),
      Color.fromARGB(20, 43, 43, 43),
    ],
  );

  // Neutral Shades
  static const Color black = Color(0xFF232323);


// ======================================Constant-Colors===========================================

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Button colors
  static const Color buttonPrimary = Color(0xFFFFFFFF);
  static const Color disabledGrey = Color.fromARGB(78, 224, 224, 224);
  static const Color buttonSecondary = Color(0xFFFFFFFF);

  // Error and validation colors
  static const Color error = Color.fromARGB(255, 255, 77, 77);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);

  // Icon Color
  static const Color icon = Color(0xFF797979);

  static const Color iconAccent = Color(0xFFFFFFFF);
  static const Color info = Color(0xFF1976D2);

  //Netural Shades
  static const Color white = Color(0xFFFFFFFF);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color darkGrey = Color(0xFF939393);
  static const Color darkerGrey = Color(0xFF4F4F4F);

  //text colours
  static const Color textPrimary = Color.fromARGB(255, 24, 25, 32);
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);

  //BOX-Shadow
  static BoxShadow boxSHadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 2,
    blurRadius: 7,
    offset: Offset(0, 3),
  );

  static BoxShadow tileShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 2,
    offset: Offset(0, 1),
  );
}

// ======================================Gradient Colors===========================================

const Gradient gradientBgTile = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromARGB(255, 248, 186, 111),
    Color.fromARGB(255, 255, 181, 62),
    Color.fromARGB(255, 255, 207, 147),
  ],
);
