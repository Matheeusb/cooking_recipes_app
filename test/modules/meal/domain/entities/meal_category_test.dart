import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should supports value comparisons', () {
    expect(
      const MealCategory(
        idCategory: '1',
        strCategory: 'Meal Test',
        strCategoryDescription: 'Meal Test Description',
        strCategoryThumb: 'Meal Test Thumb',
      ),
      equals(
        const MealCategory(
          idCategory: '1',
          strCategory: 'Meal Test',
          strCategoryDescription: 'Meal Test Description',
          strCategoryThumb: 'Meal Test Thumb',
        ),
      ),
    );
  });
}
