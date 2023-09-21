import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/routes/app_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) => CRScaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              const SizedBox(height: CRSizes.extraLarge),
              const CRText.lg(
                'Make your own \nrecipes easily',
                textAlign: TextAlign.center,
                lineHeight: 1.2,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: CRSizes.extraSmall),
              Lottie.asset(CRAnimations.foodMarket,
                  repeat: false,
                  height: 300,
                  package: 'cooking_recipes_components'),
              const Spacer(),
              const CRText.xxs(
                'Find that delicious recipe from \naround the world to make for \nyourself or your family.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CRSizes.extraLarge),
              CRButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.name),
                child: const Icon(FeatherIcons.chevronRight),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
}
