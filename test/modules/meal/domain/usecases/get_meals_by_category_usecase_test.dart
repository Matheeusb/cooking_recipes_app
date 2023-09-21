import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_item_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category_item.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/repositories/meal_repository.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meals_by_category_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MealRepository repository;
  late GetMealsByCategoryUsecase usecase;

  setUp(() {
    repository = MockMealRepository();
    usecase = GetMealsByCategoryUsecase(repository);
  });

  test(
      'Should return a list of MealCategoryItem when getMealsByCategoryUsecase returns success',
      () async {
    when(() => repository.getMealsByCategory('Just a test!')).thenAnswer(
      (_) async => const [
        MealCategoryItemModel(
          strMeal: 'Just a test!',
          strMealThumb: 'Just a test!',
          idMeal: 'Just a test!',
        ),
      ],
    );

    final result = await usecase('Just a test!');

    expect(result, isA<List<MealCategoryItem>>());
    verify(() => repository.getMealsByCategory('Just a test!')).called(1);
  });

  test(
      'Should throws MealRepositoryFailure when getMealsByCategoryUsecase returns failure',
      () {
    when(() => repository.getMealsByCategory('Just a test!'))
        .thenThrow(MealRepositoryFailure());

    expect(
        () => usecase('Just a test!'), throwsA(isA<MealRepositoryFailure>()));
    verify(() => repository.getMealsByCategory('Just a test!')).called(1);
  });
}
