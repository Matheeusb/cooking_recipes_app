import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_detail_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMealByIdUsecase extends Mock implements GetMealByIdUsecase {}

void main() {
  late GetMealByIdUsecase usecase;
  late MeaDetailStore store;

  setUp(() {
    usecase = MockGetMealByIdUsecase();
    store = MeaDetailStore(usecase);
  });

  test('Should return a PageState.loading when getMealByID method is called',
      () {
    when(() => usecase('Just a test!')).thenAnswer((_) async => const MealModel(
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
        ));

    store.getMealByID('Just a test!');

    expect(store.state.status, PageState.loading);
    expect(store.state.meal, null);
  });

  test(
      'Should return a MealModel when getMealByID method is called with success',
      () async {
    when(() => usecase('Just a test!')).thenAnswer((_) async => const MealModel(
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
        ));

    await store.getMealByID('Just a test!');

    expect(store.state.status, PageState.success);
    expect(store.state.meal, isA<Meal>());
  });

  test(
      'Should return a MealRepositoryFailure when getMealByID method is called with failure',
      () async {
    when(() => usecase('Just a test!')).thenThrow(MealRepositoryFailure());

    await store.getMealByID('Just a test!');

    expect(store.state.status, PageState.failure);
    expect(store.state.meal, null);
  });
}
