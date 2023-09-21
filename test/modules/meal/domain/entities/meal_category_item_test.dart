import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should supports value comparisons', () {
    expect(
      const MealCategoryItem(
        idMeal: '1',
        strMeal: 'Meal Test',
        strMealThumb: 'Meal Image',
      ),
      equals(
        const MealCategoryItem(
          idMeal: '1',
          strMeal: 'Meal Test',
          strMealThumb: 'Meal Image',
        ),
      ),
    );
  });
}
