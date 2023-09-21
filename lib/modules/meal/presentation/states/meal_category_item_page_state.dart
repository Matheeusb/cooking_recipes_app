import 'package:equatable/equatable.dart';

import '../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/entities/meal_category_item.dart';

class MealCategoryItemPageState extends Equatable {
  final PageState status;
  final List<MealCategoryItem> meals;

  const MealCategoryItemPageState({
    required this.status,
    this.meals = const [],
  });

  @override
  List<Object?> get props => [
        status,
        meals,
      ];
}
