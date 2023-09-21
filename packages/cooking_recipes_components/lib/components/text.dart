import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

/// A custom text widget designed for use in Flutter applications.
///
/// This widget provides a text display with various options for customization,
/// including font size, font weight, text alignment, color, and more.
///
/// Example usage:
///
/// ```dart
/// CRText.xxs(
///   'Hello, World!',
///   color: Colors.blue,
///   fontWeight: FontWeight.bold,
///   textAlign: TextAlign.center,
///   lineHeight: 1.5,
///   textDecoration: TextDecoration.underline,
/// )
/// ```
///
/// The [text] parameter is required and specifies the text to display.
///
/// You can create instances of `CRText` with different font sizes using
/// constructor named parameters like `CRText.xxs`, `CRText.xs`, `CRText.sm`, etc.
///
/// This widget uses Google Fonts to apply custom typography styles to the text.
class CRText extends StatelessWidget {
  /// The font size for the text.
  final double fontSize;

  /// The text to display.
  final String text;

  /// The font weight for the text.
  final FontWeight fontWeight;

  /// The text alignment within its container.
  final TextAlign textAlign;

  /// The text overflow behavior when the text exceeds its container.
  final TextOverflow overflow;

  /// The color of the text.
  final Color? color;

  /// The line height for the text.
  final double? lineHeight;

  /// The text decoration to apply to the text.
  final TextDecoration? textDecoration;

  /// Creates a [CRText] widget with an extra extra extra small (xxxs) font size.
  const CRText.xxxs(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 12;

  /// Creates a [CRText] widget with an extra extra small (xxs) font size.
  const CRText.xxs(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 14;

  /// Creates a [CRText] widget with an extra small (xs) font size.
  const CRText.xs(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 16;

  /// Creates a [CRText] widget with a small (sm) font size.
  const CRText.sm(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 20;

  /// Creates a [CRText] widget with a medium (md) font size.
  const CRText.md(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 22;

  /// Creates a [CRText] widget with a large (lg) font size.
  const CRText.lg(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 30;

  /// Creates a [CRText] widget with an extra large (xl) font size.
  const CRText.xl(
    this.text, {
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.lineHeight,
    this.textDecoration,
    this.overflow = TextOverflow.ellipsis,
    super.key,
  }) : fontSize = 40;

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: textAlign,
        overflow: overflow,
        style: GoogleFonts.poppins(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: lineHeight,
          decoration: textDecoration,
        ),
      );
}
