import 'package:flutter/material.dart';

import '../../../domain/entities/meal.dart';
import 'ingredient_tile_component.dart';

const ingredientImageBaseURL = 'https://www.themealdb.com/images/ingredients';

class IngredientsListComponent extends StatelessWidget {
  final Meal meal;

  const IngredientsListComponent({
    required this.meal,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.builder(
          itemCount: meal.ingredients.length,
          itemBuilder: ((_, index) {
            try {
              final currentIngredient = meal.ingredients[index];
              final currentMeasure = meal.measures[index];
              final thumbUrl = '$ingredientImageBaseURL/$currentIngredient.png';

              return IngredientTileComponent(
                thumbUrl: thumbUrl,
                title: currentIngredient,
                measure: currentMeasure,
              );
            } catch (_) {
              return const SizedBox.shrink();
            }
          }),
        ),
      );
}
