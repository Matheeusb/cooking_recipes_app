import '../../domain/entities/meal_category.dart';

class MealCategoryModel extends MealCategory {
  const MealCategoryModel({
    required super.idCategory,
    required super.strCategory,
    required super.strCategoryThumb,
    required super.strCategoryDescription,
  });

  factory MealCategoryModel.fromMap(Map<String, dynamic> map) =>
      MealCategoryModel(
        idCategory: map['idCategory'] ?? '',
        strCategory: map['strCategory'] ?? '',
        strCategoryThumb: map['strCategoryThumb'] ?? '',
        strCategoryDescription: map['strCategoryDescription'] ?? '',
      );

  static List<MealCategoryModel> fromJsonList(List source) =>
      source.map((e) => MealCategoryModel.fromMap(e)).toList();
}
