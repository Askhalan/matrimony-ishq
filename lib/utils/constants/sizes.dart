import 'package:flutter/material.dart';

class JSize {
  JSize._();

// Padding and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Basic Font Sizes
  static const double fontXsm = 10.0;
  static const double fontSm = 14.0;
  static const double fontMd = 16.0;
  static const double fontLg = 18.0;
  static const double fontXl = 20.0;
  static const double fontXxl = 24.0;

// Spacing
  static const double defaultSpace = 16.0;
  static const double defaultSpace2 = 20.0;
  static const double spaceBtwItems = 24.0;
  static const double spaceBtwSections = 32.0;

// Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 14.0;
  static const double iconMd = 30.0;
  static const double iconLg = 36.0;

// Border Radius
  static const double borderRadXsm = 2.0;
  static const double borderRadSm = 4.0;
  static const double borderRadMd = 7.0;
  static const double borderRadLg = 9.0;
  static const double borderRadXl = 15.0;
  static const double appbarBorderRad = 55.0;

// Button Sizes
  static const double btnHeight = 40.0;
  static const double buttonHeight = 16.0;
  static const double buttonRadius = 8.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

// Divider height
  static const double dividerHeight = 1.0;

// Card sizes
  static const double vUserCardHeight = 260;
  static const double vUserCardWidth = 195;
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

// Input field
  static const double inputFieldRadiusXl = 15.0;
  static const double inputFieldRadiusLg = 9.0;
  static const double spaceBtwInputFields = 16.0;


// Default Pading 
  static const double defaultPaddingValue = 20.0;
  static EdgeInsets defaultPadding = const EdgeInsets.all(20);
  //-------
  static EdgeInsets userCardInPad = const EdgeInsets.all(10);
  static EdgeInsets inputFieldPadding = const EdgeInsets.symmetric(vertical: 16,horizontal: 25);
  static EdgeInsets sessionLabelPad = const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 10);
  static EdgeInsets dropdownPading = const EdgeInsets.symmetric(horizontal: 25);
}

