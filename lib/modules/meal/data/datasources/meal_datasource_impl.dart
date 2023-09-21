import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../exceptions/meal_datasource_exception.dart';
import '../../../../core/http/http_client.dart';
import '../../../../modules/meal/data/models/meal_category_item_model.dart';
import '../../../../modules/meal/data/models/meal_category_model.dart';
import '../../../../modules/meal/data/models/meal_model.dart';
import '../../../../modules/meal/domain/entities/meal.dart';
import '../../../../modules/meal/domain/entities/meal_category.dart';
import '../../../../modules/meal/domain/entities/meal_category_item.dart';
import 'meal_datasource.dart';

const String categories = 'categories.php';
const String filterMeals = 'filter.php';
const String mealByID = 'lookup.php';

@Injectable(as: MealDatasource)
class MealDatasourceImpl implements MealDatasource {
  final HttpClient _httpClient;

  const MealDatasourceImpl(this._httpClient);

  @override
  Future<List<MealCategory>> getAllMealCategories() async {
    final responseMap = await _get(categories);

    return MealCategoryModel.fromJsonList(responseMap['categories']);
  }

  @override
  Future<List<MealCategoryItem>> getMealsByCategory(String category) async {
    final responseMap = await _get(filterMeals, {'c': category});

    return MealCategoryItemModel.fromJsonList(responseMap['meals']);
  }

  @override
  Future<Meal> getMealByID(String id) async {
    final responseMap = await _get(mealByID, {'i': id});

    return MealModel.fromMap(responseMap['meals'][0]);
  }

  Future<Map<String, dynamic>> _get(
    String url, [
    Map<String, dynamic>? queryParameters,
  ]) async {
    Response response;

    try {
      response = await _httpClient.get(url, queryParameters: queryParameters);
    } catch (_) {
      throw HttpException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestException(response.statusCode!);
    }

    try {
      final data = response.data;
      return data is Map ? data : json.decode(response.data);
    } catch (_) {
      throw JsonDecodeException();
    }
  }
}
