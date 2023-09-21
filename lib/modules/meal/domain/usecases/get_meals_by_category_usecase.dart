import 'package:injectable/injectable.dart';

import '../entities/meal_category_item.dart';
import '../repositories/meal_repository.dart';

@Injectable()
class GetMealsByCategoryUsecase {
  final MealRepository _repository;

  GetMealsByCategoryUsecase(this._repository);

  Future<List<MealCategoryItem>> call(String category) async =>
      await _repository.getMealsByCategory(category);
}
