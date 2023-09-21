import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import 'component_theme.dart';

class CRChipTheme implements CRComponentTheme {
  @override
  ChipThemeData darkTheme() => const ChipThemeData(
        selectedColor: CRColors.primary,
        disabledColor: CRColors.surfaceDark,
        pressElevation: 0,
        elevation: 0,
        labelStyle: TextStyle(
          color: CRColors.white,
        ),
      );

  @override
  ChipThemeData lightTheme() => const ChipThemeData(
        selectedColor: CRColors.primary,
        disabledColor: CRColors.surface,
        pressElevation: 0,
        elevation: 0,
        labelStyle: TextStyle(
          color: CRColors.text,
        ),
      );
}
