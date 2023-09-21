import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import '../../../../../core/dependency_injection/injection.dart';
import '../../../domain/entities/meal_category.dart';
import '../../stores/meal_category_item_store.dart';
import 'category_item_component.dart';

class ListCategoriesComponent extends StatefulWidget {
  final int itemCount;
  final List<MealCategory> categories;

  const ListCategoriesComponent({
    required this.itemCount,
    required this.categories,
    super.key,
  });

  @override
  State<ListCategoriesComponent> createState() =>
      _ListCategoriesComponentState();
}

class _ListCategoriesComponentState extends State<ListCategoriesComponent> {
  final MealCategoryItemStore _mealItemStore =
      dependencies<MealCategoryItemStore>();

  int? _selectedCategoryIndex = 0;

  void _handleSelectCategory(
    bool value,
    int index,
    MealCategory category,
  ) {
    setState(() {
      _selectedCategoryIndex = value ? index : null;
    });

    _mealItemStore.getAllMealsByCategoryName(category.strCategory);
  }

  @override
  void initState() {
    _mealItemStore.getAllMealsByCategoryName('Beef');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        itemBuilder: ((context, index) {
          final item = widget.categories[index];

          return Padding(
            padding: const EdgeInsets.only(right: CRSizes.nano),
            child: CategoryItemComponent(
              id: item.idCategory,
              description: item.strCategory,
              isSelected: _selectedCategoryIndex == index,
              onSelected: (value) => _handleSelectCategory(
                value,
                index,
                item,
              ),
            ),
          );
        }),
      );
}
