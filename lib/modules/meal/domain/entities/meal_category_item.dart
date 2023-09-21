import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class MealCategoryItem extends Equatable {
  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  const MealCategoryItem({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  @override
  List<Object?> get props => [
        strMeal,
        strMealThumb,
        idMeal,
      ];
}
