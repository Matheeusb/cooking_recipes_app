import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/entities/meal_category.dart';
import '../../domain/usecases/get_all_meal_categories_usecase.dart';
import '../states/meal_category_page_state.dart';

part 'meal_category_store.g.dart';

@Singleton()
class MealCategoryStore = _MealCategoryStoreBase with _$MealCategoryStore;

abstract class _MealCategoryStoreBase with Store {
  final GetAllMealCategoriesUsecase _getAllMealCategoriesUsecase;

  @observable
  MealCategoryPageState _state = const MealCategoryPageState(
    status: PageState.idle,
  );

  _MealCategoryStoreBase(this._getAllMealCategoriesUsecase);

  @computed
  MealCategoryPageState get state => _state;

  @action
  void _setState(MealCategoryPageState newState) => _state = newState;

  Future<void> getAllCategories() async {
    try {
      _setState(
        const MealCategoryPageState(status: PageState.loading),
      );

      final List<MealCategory> responseList = await _getAllMealCategoriesUsecase();

      _setState(
        MealCategoryPageState(
          status: PageState.success,
          categories: responseList,
        ),
      );
    } catch (_) {
      _setState(
        const MealCategoryPageState(status: PageState.failure),
      );
    }
  }
}
