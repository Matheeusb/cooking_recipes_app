import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../cooking_recipes_components.dart';
import 'button_theme.dart';
import 'checkbox_theme.dart';
import 'chip_theme.dart';
import 'text_input_theme.dart';

/// Custom dark theme data for use in Flutter applications.
///
/// This theme data is configured with custom color and styling settings
/// suitable for a dark theme.
///
/// Example usage:
///
/// ```dart
/// ThemeData darkTheme = darkThemeData;
/// ```
final ThemeData darkThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.poppins().fontFamily,
  primaryColor: CRColors.primary,
  disabledColor: CRColors.surfaceDark,
  highlightColor: CRColors.white,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: CRColors.black,
  elevatedButtonTheme: CRButtonTheme().darkTheme(),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: CRColors.white,
    bodyColor: CRColors.white,
  ),
  iconTheme: const IconThemeData(
    color: CRColors.white,
  ),
  inputDecorationTheme: CRTextInputTheme().darkTheme(),
  chipTheme: CRChipTheme().darkTheme(),
  checkboxTheme: CRCheckboxTheme().darkTheme(),
);

/// Custom light theme data for use in Flutter applications.
///
/// This theme data is configured with custom color and styling settings
/// suitable for a light theme.
///
/// Example usage:
///
/// ```dart
/// ThemeData lightTheme = lightThemeData;
/// ```
final ThemeData lightThemeData = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.poppins().fontFamily,
  primaryColor: CRColors.primary,
  disabledColor: CRColors.surface,
  highlightColor: CRColors.text,
  brightness: Brightness.light,
  scaffoldBackgroundColor: CRColors.white,
  elevatedButtonTheme: CRButtonTheme().lightTheme(),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    displayColor: CRColors.text,
    bodyColor: CRColors.text,
  ),
  iconTheme: const IconThemeData(
    color: CRColors.white,
  ),
  inputDecorationTheme: CRTextInputTheme().lightTheme(),
  chipTheme: CRChipTheme().lightTheme(),
  checkboxTheme: CRCheckboxTheme().lightTheme(),
);
