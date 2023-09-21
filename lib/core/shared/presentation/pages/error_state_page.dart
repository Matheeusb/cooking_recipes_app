import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class ErrorStatePage extends StatelessWidget {
  final VoidCallback onPressed;

  const ErrorStatePage({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            const SizedBox(height: CRSizes.mega),
            const CRText.xxs('Oops! Did something happen...'),
            const SizedBox(height: CRSizes.quarck),
            const CRText.xxxs('How about trying to recharge?'),
            CRRefreshButton(onPressed: onPressed),
          ],
        ),
      );
}
