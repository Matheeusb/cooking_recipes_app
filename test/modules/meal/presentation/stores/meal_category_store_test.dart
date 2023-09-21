import 'package:cooking_recipes_app/core/shared/presentation/states/page_state.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_all_meal_categories_usecase.dart';
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_category_store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetAllMealCategoriesUsecase extends Mock
    implements GetAllMealCategoriesUsecase {}

void main() {
  late GetAllMealCategoriesUsecase usecase;
  late MealCategoryStore store;

  setUp(() {
    usecase = MockGetAllMealCategoriesUsecase();
    store = MealCategoryStore(usecase);
  });

  test(
      'Should return a PageState.loading when getAllCategories method is called',
      () {
    when(() => usecase()).thenAnswer((_) async => [
          const MealCategoryModel(
            idCategory: 'Just a test!',
            strCategory: 'Just a test!',
            strCategoryThumb: 'Just a test!',
            strCategoryDescription: 'Just a test!',
          )
        ]);

    store.getAllCategories();

    expect(store.state.status, PageState.loading);
    expect(store.state.categories, isA<List<MealCategory>>());
    expect(store.state.categories.length, 0);
  });

  test(
      'Should return a list of MealCategoryModel when getAllCategories method is called with success',
      () async {
    when(() => usecase()).thenAnswer((_) async => [
          const MealCategoryModel(
            idCategory: 'Just a test!',
            strCategory: 'Just a test!',
            strCategoryThumb: 'Just a test!',
            strCategoryDescription: 'Just a test!',
          )
        ]);

    await store.getAllCategories();

    expect(store.state.status, PageState.success);
    expect(store.state.categories, isA<List<MealCategory>>());
    expect(store.state.categories.length, 1);
  });

  test(
      'Should return a MealRepositoryFailure when getAllCategories method is called with failure',
      () async {
    when(() => usecase()).thenThrow(MealRepositoryFailure());

    await store.getAllCategories();

    expect(store.state.status, PageState.failure);
    expect(store.state.categories.length, 0);
  });
}
