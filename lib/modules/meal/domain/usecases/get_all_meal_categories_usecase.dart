import 'package:injectable/injectable.dart';

import '../entities/meal_category.dart';
import '../repositories/meal_repository.dart';

@injectable
class GetAllMealCategoriesUsecase {
  final MealRepository _repository;

  GetAllMealCategoriesUsecase(this._repository);

  Future<List<MealCategory>> call() async =>
      await _repository.getAllMealCategories();
}
