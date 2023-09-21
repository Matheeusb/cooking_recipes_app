import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_item_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be a subclass of MealCategoryItem', () {
    expect(
        const MealCategoryItemModel(
          strMeal: 'Just a test!',
          strMealThumb: 'Just a test!',
          idMeal: 'Just a test!',
        ),
        isA<MealCategoryItem>());
  });
}
