import 'dart:ui';

/// A collection of custom color constants for use in Flutter applications.
///
/// This abstract class provides convenient static constants for referencing
/// custom color values used throughout the application's user interface.
///
/// Example usage:
///
/// ```dart
/// CRColors.primary // Use this constant to access the primary color.
/// CRColors.accent // Use this constant to access the accent color.
/// CRColors.text // Use this constant to access the text color.
/// ```
abstract class CRColors {
  CRColors._();

  /// The primary color used in the application.
  static const Color primary = Color(0xFFF88E4E);

  /// The accent color used in the application.
  static const Color accent = Color(0xFFFFA269);

  /// The secondary color used in the application.
  static const Color secondary = Color(0xFFF9BD98);

  /// The text color used in the application.
  static const Color text = Color(0xFF513C30);

  /// The secondary text color used in the application.
  static const Color secondaryText = Color(0xFFB2AAAA);

  /// The surface color used in the application.
  static const Color surface = Color(0xFFEDEDED);

  /// The dark surface color used in the application.
  static const Color surfaceDark = Color(0xFF2C2C2C);

  /// The white color used in the application.
  static const Color white = Color(0xFFFFFFFF);

  /// The black color used in the application.
  static const Color black = Color(0xFF111111);

  /// The error color used in the application.
  static const Color error = Color(0xFFB00020);

  /// The start color for gradients used in the application.
  static const Color gradientStart = Color(0xFFFAF5F5);

  /// The end color for gradients used in the application.
  static const Color gradientEnd = Color(0xFFF0F0F0);

  /// The success color used in the application.
  static const Color success = Color(0xFF89EA6B);

  /// The neutral color used in the application.
  static const Color neutral = Color(0xFFD6D6D6);
}
