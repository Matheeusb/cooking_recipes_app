import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import 'shimmer_ingredients_list_component.dart';

class ShimmerMealDetailComponent extends StatelessWidget {
  const ShimmerMealDetailComponent({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          const SizedBox(height: CRSizes.tera),
          CRShimmerTile.radiusSquare(
            width: 150,
            height: 150,
          ),
          const SizedBox(height: CRSizes.micro),
          CRShimmerTile.radiusSquare(
            width: 150,
            height: 20,
            radius: 4,
          ),
          const SizedBox(height: CRSizes.huge),
          CRShimmerTile.radiusSquare(
            width: 250,
            height: 45,
            radius: 25,
          ),
          const SizedBox(height: CRSizes.huge),
          const Expanded(child: ShimmerIngredientsListComponent()),
        ],
      );
}
