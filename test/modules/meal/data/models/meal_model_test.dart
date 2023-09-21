import 'package:cooking_recipes_app/modules/meal/data/models/meal_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should be a subclass of Meal', () {
    expect(
        const MealModel(
          idMeal: 'Just a test!',
          strMeal: 'Just a test!',
          strCategory: 'Just a test!',
          strArea: 'Just a test!',
          strInstructions: 'Just a test!',
          strMealThumb: 'Just a test!',
          strYoutube: 'Just a test!',
          ingredients: [
            'Just a test!',
            'Just a test!',
          ],
          measures: [
            'Just a test!',
            'Just a test!',
          ],
        ),
        isA<Meal>());
  });
}
