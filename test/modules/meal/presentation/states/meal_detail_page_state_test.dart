import 'package:cooking_recipes_app/modules/meal/presentation/states/meal_detail_page_state.dart';
import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    test('Should supports value comparisons', () {
      expect(
        const MealDetailPageState(status: PageState.idle),
        equals(
          const MealDetailPageState(status: PageState.idle),
        ),
      );
    });
}
