import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import 'component_theme.dart';

class CRCheckboxTheme implements CRComponentTheme {
  @override
  CheckboxThemeData darkTheme() => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return CRColors.primary;
            }

            if (states.contains(MaterialState.disabled)) {
              return CRColors.surfaceDark;
            }

            return CRColors.primary;
          },
        ),
      );

  @override
  CheckboxThemeData lightTheme() => CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return CRColors.primary;
            }

            if (states.contains(MaterialState.disabled)) {
              return CRColors.surface;
            }

            return CRColors.primary;
          },
        ),
      );
}
