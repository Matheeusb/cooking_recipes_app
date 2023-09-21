import 'package:flutter/material.dart';

import '../tokens/colors.dart';
import 'component_theme.dart';

class CRButtonTheme implements CRComponentTheme {
  @override
  ElevatedButtonThemeData darkTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return CRColors.accent;
              }

              if (states.contains(MaterialState.disabled)) {
                return CRColors.surfaceDark;
              }

              return CRColors.primary;
            },
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );

  @override
  ElevatedButtonThemeData lightTheme() => ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return CRColors.accent;
              }

              if (states.contains(MaterialState.disabled)) {
                return CRColors.surface;
              }

              return CRColors.primary;
            },
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
}
