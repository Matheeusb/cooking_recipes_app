import 'package:equatable/equatable.dart';

import '../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/entities/meal_category.dart';

class MealCategoryPageState extends Equatable {
  final PageState status;
  final List<MealCategory> categories;

  const MealCategoryPageState({
    required this.status,
    this.categories = const [],
  });

  @override
  List<Object?> get props => [
        status,
        categories,
      ];
}
