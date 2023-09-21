import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class ReloadCategoriesComponent extends StatelessWidget {
  final VoidCallback onPressed;

  const ReloadCategoriesComponent({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CRText.xxs(
            'Oops! We had a problem... \nHow about trying to recharge?',
          ),
          CRRefreshButton(onPressed: onPressed),
        ],
      );
}
