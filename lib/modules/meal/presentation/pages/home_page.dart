import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/shared/presentation/pages/error_state_page.dart';
import '../../../../core/shared/presentation/states/page_state.dart';
import '../../../../core/shared/presentation/stores/user_store.dart';
import '../components/home/categories_component.dart';
import '../components/home/meals_grid_component.dart';
import '../components/home/shimmer_grid_items_component.dart';
import '../stores/meal_category_item_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MealCategoryItemStore _store = dependencies<MealCategoryItemStore>();
  final UserStore _userStore = dependencies<UserStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CRSizes.small,
            ),
            child: Observer(
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CRSectionHeader(
                    username: _userStore.userData.name,
                    title: 'What are we doing today?',
                    subtitle: 'You can choose one of the categories below.',
                  ),
                  const SizedBox(height: CRSizes.medium),
                  const SizedBox(
                    height: CRSizes.tera,
                    child: CategoriesComponent(),
                  ),
                  const SizedBox(height: CRSizes.extraLarge),
                  Expanded(
                    child: switch (_store.state.status) {
                      PageState.loading => const ShimmerGridItemsComponent(),
                      PageState.success => MealsGridComponent(
                          meals: _store.state.meals,
                        ),
                      PageState.failure => ErrorStatePage(
                          onPressed: () => _store.getAllMealsByCategoryName(
                            _store.currentCategoryName,
                          ),
                        ),
                      _ => const SizedBox.shrink(),
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
