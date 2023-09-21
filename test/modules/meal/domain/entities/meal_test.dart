import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should supports value comparisons', () {
    expect(
      const Meal(
        idMeal: '1',
        strMeal: 'Pate Chinois',
        strCategory: 'Beef',
        strArea: 'Japan',
        strInstructions: 'Some instruction',
        strMealThumb: 'http://meal.png',
        strYoutube: 'http://youtube.com/watch',
        ingredients: [],
        measures: [],
      ),
      equals(
        const Meal(
          idMeal: '1',
          strMeal: 'Pate Chinois',
          strCategory: 'Beef',
          strArea: 'Japan',
          strInstructions: 'Some instruction',
          strMealThumb: 'http://meal.png',
          strYoutube: 'http://youtube.com/watch',
          ingredients: [],
          measures: [],
        ),
      ),
    );
  });
}
