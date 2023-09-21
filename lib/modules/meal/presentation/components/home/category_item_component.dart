import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class CategoryItemComponent extends StatelessWidget {
  final String id;
  final String description;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;

  const CategoryItemComponent({
    required this.id,
    required this.description,
    this.isSelected = false,
    this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ChoiceChip(
      label: CRText.xxs(
        description,
        fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
      ),
      selected: isSelected,
      onSelected: onSelected,
    );
}
