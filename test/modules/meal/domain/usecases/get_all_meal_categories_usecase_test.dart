import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/repositories/meal_repository.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_all_meal_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MealRepository repository;
  late GetAllMealCategoriesUsecase usecase;

  setUp(() {
    repository = MockMealRepository();
    usecase = GetAllMealCategoriesUsecase(repository);
  });

  test(
      'Should return a list of MealCategory when getAllMealCategoriesUsecase returns success',
      () async {
    when(() => repository.getAllMealCategories()).thenAnswer(
      (_) async => [
        const MealCategoryModel(
          idCategory: 'Just a test!',
          strCategory: 'Just a test!',
          strCategoryThumb: 'Just a test!',
          strCategoryDescription: 'Just a test!',
        )
      ],
    );

    final result = await usecase();

    expect(result, isA<List<MealCategory>>());
    expect(result.length, 1);
    verify(() => repository.getAllMealCategories()).called(1);
  });

  test(
      'Should throws MealRepositoryFailure when getAllMealCategoriesUsecase returns failure',
      () {
    when(() => repository.getAllMealCategories())
        .thenThrow(MealRepositoryFailure());

    expect(() => usecase(), throwsA(isA<MealRepositoryFailure>()));
    verify(() => repository.getAllMealCategories()).called(1);
  });
}
