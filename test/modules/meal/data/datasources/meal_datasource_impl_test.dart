import 'dart:io';

import 'package:cooking_recipes_app/core/http/http_client.dart';
import 'package:cooking_recipes_app/modules/meal/data/datasources/meal_datasource_impl.dart';
import 'package:cooking_recipes_app/modules/meal/data/exceptions/meal_datasource_exception.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_item_model.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_category_model.dart';
import 'package:cooking_recipes_app/modules/meal/data/models/meal_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks/http_stub.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  late HttpClient httpClient;
  late HttpStubs httpStubs;
  late MealDatasourceImpl datasource;

  setUp(() {
    httpClient = MockHttpClient();
    httpStubs = HttpStubs(httpClient);
    datasource = MealDatasourceImpl(httpClient);
  });

  group('getAllMealCategories', () {
    test(
        'Should return a list of MealCategoryModel when getAllMealCategories returns a success',
        () async {
      httpStubs.setupHttpClientResponse(
        categories,
        File('test/mocks/jsons/meal_categories.json').readAsStringSync(),
      );

      final result = await datasource.getAllMealCategories();

      expect(result, isA<List<MealCategoryModel>>());
      verify(() => httpClient.get(categories)).called(1);
    });

    test(
        'Should throws HttpException when getAllMealCategories returns a error',
        () {
      httpStubs.setupHttpClientResponse(
        categories,
        null,
        responseType: ResponseType.error,
      );

      expect(
        () => datasource.getAllMealCategories(),
        throwsA(isA<HttpException>()),
      );
    });

    test(
      'Should throws HttpRequestFailure when getAllMealCategories returns a status code is not 200',
      () {
        httpStubs.setupHttpClientResponse(
          categories,
          null,
          responseType: ResponseType.failure,
        );

        expect(
          () => datasource.getAllMealCategories(),
          throwsA(
            isA<HttpRequestException>().having(
              (error) => error.statusCode,
              'statusCode',
              400,
            ),
          ),
        );
      },
    );

    test(
      'Should throws JsonDecodeException when getAllMealCategories returns a invalid json',
      () {
        httpStubs.setupHttpClientResponse(
          categories,
          'invalid JSON',
        );

        expect(
          () => datasource.getAllMealCategories(),
          throwsA(isA<JsonDecodeException>()),
        );
      },
    );
  });

  group('getMealsByCategory', () {
    test(
        'Should return a list of MealCategoryModel when getMealsByCategory returns a success',
        () async {
      httpStubs.setupHttpClientResponse(
        filterMeals,
        File('test/mocks/jsons/meal.json').readAsStringSync(),
        queryParameters: {'c': 'Just a test!'},
      );

      final result = await datasource.getMealsByCategory('Just a test!');

      expect(result, isA<List<MealCategoryItemModel>>());
      verify(() => httpClient.get(
            filterMeals,
            queryParameters: {'c': 'Just a test!'},
          )).called(1);
    });

    test('Should throws HttpException when getMealsByCategory returns a error',
        () {
      httpStubs.setupHttpClientResponse(
        filterMeals,
        null,
        responseType: ResponseType.error,
        queryParameters: {'c': 'Just a test!'},
      );

      expect(
        () => datasource.getMealsByCategory('Just a test!'),
        throwsA(isA<HttpException>()),
      );
    });

    test(
      'Should throws HttpRequestFailure when getMealsByCategory returns a status code is not 200',
      () {
        httpStubs.setupHttpClientResponse(
          filterMeals,
          null,
          responseType: ResponseType.failure,
          queryParameters: {'c': 'Just a test!'},
        );

        expect(
          () => datasource.getMealsByCategory('Just a test!'),
          throwsA(
            isA<HttpRequestException>().having(
              (error) => error.statusCode,
              'statusCode',
              400,
            ),
          ),
        );
      },
    );

    test(
      'Should throws JsonDecodeException when getMealsByCategory returns a invalid json',
      () {
        httpStubs.setupHttpClientResponse(
          filterMeals,
          'invalid JSON',
          queryParameters: {'c': 'Just a test!'},
        );

        expect(
          () => datasource.getMealsByCategory('Just a test!'),
          throwsA(isA<JsonDecodeException>()),
        );
      },
    );
  });

  group('getMealByID', () {
    test('Should return a list of MealModel when getMealByID returns a success',
        () async {
      httpStubs.setupHttpClientResponse(
        mealByID,
        File('test/mocks/jsons/meal.json').readAsStringSync(),
        queryParameters: {'i': 'Just a test!'},
      );

      final result = await datasource.getMealByID('Just a test!');

      expect(result, isA<MealModel>());
      verify(
        () => httpClient.get(
          mealByID,
          queryParameters: {'i': 'Just a test!'},
        ),
      );
    });

    test('Should throws HttpException when getMealByID returns a error', () {
      httpStubs.setupHttpClientResponse(
        mealByID,
        null,
        responseType: ResponseType.error,
        queryParameters: {'i': 'Just a test!'},
      );

      expect(
        () => datasource.getMealByID('Just a test!'),
        throwsA(isA<HttpException>()),
      );
    });

    test(
      'Should throws HttpRequestFailure when getMealByID returns a status code is not 200',
      () async {
        httpStubs.setupHttpClientResponse(
          mealByID,
          null,
          responseType: ResponseType.failure,
          queryParameters: {'i': 'Just a test!'},
        );

        expect(
          () => datasource.getMealByID('Just a test!'),
          throwsA(
            isA<HttpRequestException>().having(
              (error) => error.statusCode,
              'statusCode',
              400,
            ),
          ),
        );
      },
    );

    test(
      'Should throws JsonDecodeException when getMealByID returns a invalid json',
      () {
        httpStubs.setupHttpClientResponse(
          mealByID,
          'invalid JSON',
          queryParameters: {'i': 'Just a test!'},
        );

        expect(
          () => datasource.getMealByID('Just a test!'),
          throwsA(isA<JsonDecodeException>()),
        );
      },
    );
  });
}
