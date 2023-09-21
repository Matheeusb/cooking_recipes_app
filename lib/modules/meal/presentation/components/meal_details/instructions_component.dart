import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class InstructionsComponent extends StatelessWidget {
  final String instructions;

  const InstructionsComponent({
    required this.instructions,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: SingleChildScrollView(
          child: CRText.xxs(
            instructions,
            overflow: TextOverflow.visible,
          ),
        ),
      );
}
