import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/presentation/states/meal_category_page_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should supports value comparisons', () {
    expect(
      const MealCategoryPageState(
        status: PageState.success,
        categories: [
          MealCategoryModel(
            idCategory: 'Just a test!',
            strCategory: 'Just a test!',
            strCategoryThumb: 'Just a test!',
            strCategoryDescription: 'Just a test!',
          )
        ],
      ),
      equals(
        const MealCategoryPageState(
          status: PageState.success,
          categories: [
            MealCategoryModel(
              idCategory: 'Just a test!',
              strCategory: 'Just a test!',
              strCategoryThumb: 'Just a test!',
              strCategoryDescription: 'Just a test!',
            )
          ],
        ),
      ),
    );
  });
}
