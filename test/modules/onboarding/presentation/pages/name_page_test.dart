import 'package:cooking_recipes_app/core/dependency_injection/injection.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_all_meal_categories_usecase.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meals_by_category_usecase.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/components/name_answer_component.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/components/name_form_component.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/pages/name_page.dart';
import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/app_mock.dart';

class MockGetAllMealCategoriesUsecase extends Mock
    implements GetAllMealCategoriesUsecase {}

class MockGetMealsByCategoryUsecase extends Mock
    implements GetMealsByCategoryUsecase {}

void main() {
  late Widget page;

  setUp(() {
    page = const NamePage();
  });

  setUpAll(() {
    configureInjection();
  });

  testWidgets('Should display components when NamePage is opened',
      (widgetTester) async {
    await widgetTester.pumpWidget(AppMock(child: page));
    await widgetTester.pumpAndSettle();

    expect(find.byType(NameAnswerComponent), findsOneWidget);
    expect(find.byType(NameFormComponent), findsOneWidget);
  });

  testWidgets('Should show error message when name "a" is typed',
      (widgetTester) async {
    await widgetTester.pumpWidget(AppMock(child: page));
    await widgetTester.pumpAndSettle();

    final Finder nameTextField = find.byType(CRTextField);
    await widgetTester.enterText(nameTextField, 'a');
    await widgetTester.pumpAndSettle();

    expect(find.text('Your name must be at least 3 characters long'),
        findsOneWidget);
  });

  testWidgets('Should show error message when name is not typed',
      (widgetTester) async {
    await widgetTester.pumpWidget(AppMock(child: page));
    await widgetTester.pumpAndSettle();

    final Finder button = find.byType(CRButton);
    await widgetTester.tap(button);
    await widgetTester.pumpAndSettle();

    expect(
        find.text('I would like to know your name, it could be a nickname 😁'),
        findsOneWidget);
  });
}
