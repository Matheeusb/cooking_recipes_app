import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import 'component_theme.dart';

class CRTextInputTheme implements CRComponentTheme {
  @override
  InputDecorationTheme darkTheme() => const InputDecorationTheme(
        alignLabelWithHint: true,
        floatingLabelStyle: TextStyle(color: CRColors.primary),
        labelStyle: TextStyle(color: CRColors.secondaryText),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.error,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.surfaceDark,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.primary,
          ),
        ),
      );

  @override
  InputDecorationTheme lightTheme() => const InputDecorationTheme(
        alignLabelWithHint: true,
        floatingLabelStyle: TextStyle(color: CRColors.primary),
        labelStyle: TextStyle(color: CRColors.secondaryText),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.error,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.primary,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.surface,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CRColors.primary,
          ),
        ),
      );
}
