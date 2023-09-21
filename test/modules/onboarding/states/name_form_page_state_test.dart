import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/states/name_form_page_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should supports value comparisons', () {
    expect(
      const NameFormPageState(
        status: PageState.success,
      ),
      equals(
        const NameFormPageState(
          status: PageState.success,
        ),
      ),
    );
  });
}
