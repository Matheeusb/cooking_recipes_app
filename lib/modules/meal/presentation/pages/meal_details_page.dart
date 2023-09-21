import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/shared/presentation/pages/error_state_page.dart';
import '../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/entities/meal_category_item.dart';
import '../components/meal_details/header_actions_component.dart';
import '../components/meal_details/ingredients_list_component.dart';
import '../components/meal_details/instructions_component.dart';
import '../components/meal_details/meal_thumb_component.dart';
import '../components/meal_details/shimmer_meal_detail_component.dart';
import '../stores/meal_detail_store.dart';

class MealDetailsPage extends StatefulWidget {
  final MealCategoryItem meal;

  const MealDetailsPage({
    required this.meal,
    super.key,
  });

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  final MeaDetailStore _store = dependencies<MeaDetailStore>();
  late int _activeTabIndex;

  void _handleSelected(int value) => setState(() => _activeTabIndex = value);

  @override
  void initState() {
    super.initState();
    _getMealByID();
    _activeTabIndex = 0;
  }

  _getMealByID() => _store.getMealByID(widget.meal.idMeal);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CRSizes.small,
            ),
            child: Observer(
                builder: (_) => switch (_store.state.status) {
                      PageState.loading => const ShimmerMealDetailComponent(),
                      PageState.success => Column(
                          children: <Widget>[
                            const HeaderActionsComponent(),
                            const SizedBox(height: CRSizes.extraLarge),
                            MealThumbComponent(meal: _store.state.meal!),
                            const SizedBox(height: CRSizes.giga),
                            CRTab(onChanged: _handleSelected),
                            const SizedBox(height: CRSizes.extraLarge),
                            _activeTabIndex == 1
                                ? InstructionsComponent(
                                    instructions:
                                        _store.state.meal!.strInstructions,
                                  )
                                : IngredientsListComponent(
                                    meal: _store.state.meal!,
                                  )
                          ],
                        ),
                      PageState.failure => ErrorStatePage(
                          onPressed: _getMealByID,
                        ),
                      _ => const SizedBox.shrink(),
                    }),
          ),
        ),
      );
}
