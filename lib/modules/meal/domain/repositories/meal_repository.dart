import '../entities/meal.dart';
import '../entities/meal_category.dart';
import '../entities/meal_category_item.dart';

abstract interface class MealRepository {
  Future<List<MealCategory>> getAllMealCategories();
  Future<List<MealCategoryItem>> getMealsByCategory(String category);
  Future<Meal> getMealByID(String id);
}
