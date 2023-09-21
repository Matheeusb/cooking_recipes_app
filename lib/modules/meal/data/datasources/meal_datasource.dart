import '../../../../modules/meal/domain/entities/meal.dart';
import '../../../../modules/meal/domain/entities/meal_category.dart';
import '../../../../modules/meal/domain/entities/meal_category_item.dart';

abstract interface class MealDatasource {
  Future<List<MealCategory>> getAllMealCategories();
  Future<List<MealCategoryItem>> getMealsByCategory(String category);
  Future<Meal> getMealByID(String id);
}
