import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/meal.dart';

class MealThumbComponent extends StatelessWidget {
  final Meal meal;

  const MealThumbComponent({
    required this.meal,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: 200,
        child: CRMealItem(
          description: meal.strMeal,
          imageUrl: meal.strMealThumb,
          isDetail: true,
        ),
      );
}
