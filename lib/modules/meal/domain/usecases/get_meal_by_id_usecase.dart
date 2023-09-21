import 'package:injectable/injectable.dart';

import '../entities/meal.dart';
import '../repositories/meal_repository.dart';

@injectable
class GetMealByIdUsecase {
  final MealRepository _repository;

  GetMealByIdUsecase(this._repository);

  Future<Meal> call(String id) async => await _repository.getMealByID(id);
}
