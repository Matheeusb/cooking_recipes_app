import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be a subclass of MealCategory', () {
    expect(
        const MealCategoryModel(
          idCategory: 'Just a test!',
          strCategory: 'Just a test!',
          strCategoryThumb: 'Just a test!',
          strCategoryDescription: 'Just a test!',
        ),
        isA<MealCategory>());
  });
}
