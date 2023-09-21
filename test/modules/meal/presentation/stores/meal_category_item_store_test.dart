import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_item_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category_item.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meals_by_category_usecase.dart';
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_category_item_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetMealsByCategoryUsecase extends Mock
    implements GetMealsByCategoryUsecase {}

void main() {
  late GetMealsByCategoryUsecase usecase;
  late MealCategoryItemStore store;

  setUp(() {
    usecase = MockGetMealsByCategoryUsecase();
    store = MealCategoryItemStore(usecase);
  });

  test(
      'Should return a PageState.loading when getAllMealsByCategoryName method is called',
      () {
    when(() => usecase('Beef')).thenAnswer((_) async => [
          const MealCategoryItemModel(
            strMeal: 'Just a test!',
            strMealThumb: 'Just a test!',
            idMeal: 'Just a test!',
          )
        ]);

    store.getAllMealsByCategoryName('Beef');

    expect(store.state.status, PageState.loading);
    expect(store.state.meals, isA<List<MealCategoryItem>>());
    expect(store.state.meals.length, 0);
  });

  test(
      'Should return a list of MealCategoryItemModel when getAllMealsByCategoryName method is called with success',
      () async {
    when(() => usecase('Beef')).thenAnswer((_) async => [
          const MealCategoryItemModel(
            strMeal: 'Just a test!',
            strMealThumb: 'Just a test!',
            idMeal: 'Just a test!',
          )
        ]);

    await store.getAllMealsByCategoryName('Beef');

    expect(store.state.status, PageState.success);
    expect(store.state.meals, isA<List<MealCategoryItem>>());
    expect(store.state.meals.length, 1);
  });

  test(
      'Should return a MealRepositoryFailure when getAllMealsByCategoryName method is called with failure',
      () async {
    when(() => usecase('Beef')).thenThrow(MealRepositoryFailure());

    await store.getAllMealsByCategoryName('Beef');

    expect(store.state.status, PageState.failure);
    expect(store.state.meals.length, 0);
  });
}
