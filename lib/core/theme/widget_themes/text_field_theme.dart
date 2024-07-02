
import 'package:flutter/material.dart';
import 'package:ishq/utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class JTextFormFieldTheme {
  JTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 3,
      prefixIconColor: JColor.secondary,
      suffixIconColor: JColor.secondary,
      // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
      labelStyle: const TextStyle()
          .copyWith(fontSize: JSize.fontMd, color: JColor.black),
      hintStyle: const TextStyle()
          .copyWith(fontSize: JSize.fontSm, color: JColor.black),
      errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
      floatingLabelStyle:
          const TextStyle().copyWith(color: JColor.black.withOpacity(0.8)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: const BorderRadius.all(Radius.circular(JSize.inputFieldRadiusXl)),
        borderSide: const BorderSide(width: 1, color: JColor.grey),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.grey),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.primary),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.warning),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 2, color: JColor.warning),
      ),
      filled: true,
      fillColor: JColor.secondary,
      contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 12.0),
      );

//---------------------------------- Dark Theme ----------------------------------

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      errorMaxLines: 2,
      prefixIconColor: JColor.secondary,
      suffixIconColor: JColor.secondary,
      // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
      labelStyle: const TextStyle()
          .copyWith(fontSize: JSize.fontMd, color: JColor.white),
      hintStyle: const TextStyle()
          .copyWith(fontSize: JSize.fontSm, color: JColor.white),
      floatingLabelStyle:
          const TextStyle().copyWith(color: JColor.white.withOpacity(0.8)),
      border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusXl),
        borderSide: const BorderSide(width: 1, color: JColor.darkGrey),
      ),
      enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.secondary),
      ),
      focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.white),
      ),
      errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 1, color: JColor.warning),
      ),
      focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(JSize.inputFieldRadiusLg),
        borderSide: const BorderSide(width: 2, color: JColor.warning),
      ),
      fillColor: JColor.bgSecondary,
      contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 12.0),
            );
}
