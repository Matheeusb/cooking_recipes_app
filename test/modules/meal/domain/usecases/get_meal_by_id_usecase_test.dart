import 'package:cooking_recipes_app/modules/meal/data/models/meal_model.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/repositories/meal_repository.dart';
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meal_by_id_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MealRepository repository;
  late GetMealByIdUsecase usecase;

  setUp(() {
    repository = MockMealRepository();
    usecase = GetMealByIdUsecase(repository);
  });

  test('Should return a Meal when getMealByIdUsecase returns success',
      () async {
    when(() => repository.getMealByID('Just a test!')).thenAnswer(
      (_) async => const MealModel(
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
      ),
    );

    final result = await usecase('Just a test!');

    expect(result, isA<Meal>());
    verify(() => repository.getMealByID('Just a test!')).called(1);
  });

  test(
      'Should throws MealRepositoryFailure when getMealByIdUsecase returns failure',
      () {
    when(() => repository.getMealByID('Just a test!'))
        .thenThrow(MealRepositoryFailure());

    expect(() => usecase('Just a test!'), throwsA(isA<MealRepositoryFailure>()));
    verify(() => repository.getMealByID('Just a test!')).called(1);
  });
}
