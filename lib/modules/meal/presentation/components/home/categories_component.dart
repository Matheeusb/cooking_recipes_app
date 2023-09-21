import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/dependency_injection/injection.dart';
import '../../../../../core/shared/presentation/states/page_state.dart';
import '../../stores/meal_category_store.dart';
import 'list_categories_component.dart';
import 'reload_categories_component.dart';
import 'shimmer_categories_list_component.dart';

class CategoriesComponent extends StatefulWidget {
  const CategoriesComponent({super.key});

  @override
  State<CategoriesComponent> createState() => _CategoriesComponentState();
}

class _CategoriesComponentState extends State<CategoriesComponent> {
  final MealCategoryStore _store = dependencies<MealCategoryStore>();

  @override
  void didChangeDependencies() {
    _store.getAllCategories();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => switch (_store.state.status) {
          PageState.loading => const ShimmerCategoriesListComponent(),
          PageState.success => ListCategoriesComponent(
              itemCount: _store.state.categories.length,
              categories: _store.state.categories,
            ),
          PageState.failure => ReloadCategoriesComponent(
              onPressed: _store.getAllCategories,
            ),
          _ => Container(),
        },
      );
}
