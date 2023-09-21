import 'package:equatable/equatable.dart';

import '../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/entities/meal.dart';

class MealDetailPageState extends Equatable {
  final PageState status;
  final Meal? meal;

  const MealDetailPageState({
    this.status = PageState.idle,
    this.meal,
  });

  @override
  List<Object?> get props => [
        status,
        meal,
      ];
}
