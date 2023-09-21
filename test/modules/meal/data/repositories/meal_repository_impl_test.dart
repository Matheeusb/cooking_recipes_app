import 'package:cooking_recipes_app/modules/meal/data/datasources/meal_datasource.dart';
import 'package:cooking_recipes_app/modules/meal/data/exceptions/meal_datasource_exception.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_item_model.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_model.dart';
import 'package:cooking_recipes_app/modules/meal/data/repositories/meal_repository_impl.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category.dart';
import 'package:cooking_recipes_app/modules/meal/domain/entities/meal_category_item.dart';
import 'package:cooking_recipes_app/modules/meal/domain/failures/meal_failure.dart';
import 'package:cooking_recipes_app/modules/meal/domain/repositories/meal_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMealDatasource extends Mock implements MealDatasource {}

void main() {
  late MealDatasource datasource;
  late MealRepository repository;

  setUp(() {
    datasource = MockMealDatasource();
    repository = MealRepositoryImpl(datasource);
  });

  test(
    'Should return a list of MealCategory when datasource returns a success',
    () async {
      when(() => datasource.getAllMealCategories()).thenAnswer(
        (_) async => [
          const MealCategoryModel(
            idCategory: 'Just a test!',
            strCategory: 'Just a test!',
            strCategoryThumb: 'Just a test!',
            strCategoryDescription: 'Just a test!',
          ),
        ],
      );

      final result = await repository.getAllMealCategories();

      expect(result, isA<List<MealCategory>>());
      expect(result.length, 1);
      verify(() => datasource.getAllMealCategories()).called(1);
    },
  );

  test(
    'Should throws a MealRepositoryFailure when getAllMealCategories throws an MealDatasourceException',
    () {
      when(() => datasource.getAllMealCategories())
          .thenThrow(MealDatasourceException());

      expect(
        () => repository.getAllMealCategories(),
        throwsA(isA<MealRepositoryFailure>()),
      );

      verify(() => datasource.getAllMealCategories()).called(1);
    },
  );

  test(
    'Should return a list of MealCategoryItem when datasource returns a success',
    () async {
      when(() => datasource.getMealsByCategory('Just a test!')).thenAnswer(
        (_) async => [
          const MealCategoryItemModel(
            strMeal: 'Just a test!',
            strMealThumb: 'Just a test!',
            idMeal: 'Just a test!',
          ),
        ],
      );

      final result = await repository.getMealsByCategory('Just a test!');

      expect(result, isA<List<MealCategoryItem>>());
      expect(result.length, 1);
      verify(() => datasource.getMealsByCategory('Just a test!')).called(1);
    },
  );

  test(
    'Should throws a MealRepositoryFailure when getMealsByCategory throws an MealDatasourceException',
    () {
      when(() => datasource.getMealsByCategory('Just a test!'))
          .thenThrow(MealDatasourceException());

      expect(
        () => repository.getMealsByCategory('Just a test!'),
        throwsA(isA<MealRepositoryFailure>()),
      );

      verify(() => datasource.getMealsByCategory('Just a test!')).called(1);
    },
  );

  test(
    'Should return a Meal when datasource returns a success',
    () async {
      when(
        () => datasource.getMealByID('Just a test!'),
      ).thenAnswer(
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

      final result = await repository.getMealByID('Just a test!');

      expect(result, isA<Meal>());
      verify(() => datasource.getMealByID('Just a test!')).called(1);
    },
  );

  test(
    'Should throws a MealRepositoryFailure when getMealByID throws an MealDatasourceException',
    () {
      when(
        () => datasource.getMealByID('Just a test!'),
      ).thenThrow(MealDatasourceException());

      expect(
        () => repository.getMealByID('Just a test!'),
        throwsA(isA<MealRepositoryFailure>()),
      );

      verify(() => datasource.getMealByID('Just a test!')).called(1);
    },
  );
}
