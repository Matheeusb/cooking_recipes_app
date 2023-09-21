import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../domain/entities/meal_category_item.dart';

class MealsGridComponent extends StatelessWidget {
  final List<MealCategoryItem> meals;

  const MealsGridComponent({
    required this.meals,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: meals.length,
        itemBuilder: (_, index) {
          final meal = meals[index];

          return InkWell(
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.mealDetail,
              arguments: meal,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: CRMealItem(
                description: meal.strMeal,
                imageUrl: meal.strMealThumb,
              ),
            ),
          );
        },
      );
}
