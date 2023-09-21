import 'package:injectable/injectable.dart';

import '../../domain/failures/meal_failure.dart';
import '../exceptions/meal_datasource_exception.dart';
import '../../domain/entities/meal.dart';
import '../../domain/entities/meal_category.dart';
import '../../domain/entities/meal_category_item.dart';
import '../../domain/repositories/meal_repository.dart';
import '../datasources/meal_datasource.dart';

@Injectable(as: MealRepository)
class MealRepositoryImpl implements MealRepository {
  final MealDatasource _datasource;

  MealRepositoryImpl(this._datasource);

  @override
  Future<List<MealCategory>> getAllMealCategories() async {
    try {
      return await _datasource.getAllMealCategories();
    } on MealDatasourceException {
      throw MealRepositoryFailure();
    }
  }

  @override
  Future<List<MealCategoryItem>> getMealsByCategory(String category) async {
    try {
      return await _datasource.getMealsByCategory(category);
    } on MealDatasourceException {
      throw MealRepositoryFailure();
    }
  }

  @override
  Future<Meal> getMealByID(String id) async {
    try {
      return await _datasource.getMealByID(id);
    } on MealDatasourceException {
      throw MealRepositoryFailure();
    }
  }
}
