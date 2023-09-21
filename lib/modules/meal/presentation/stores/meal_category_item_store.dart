import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/usecases/get_meals_by_category_usecase.dart';
import '../states/meal_category_item_page_state.dart';

part 'meal_category_item_store.g.dart';

@Singleton()
class MealCategoryItemStore = _MealCategoryItemStoreBase
    with _$MealCategoryItemStore;

abstract class _MealCategoryItemStoreBase with Store {
  final GetMealsByCategoryUsecase _getMealsByCategoryUsecase;

  @observable
  MealCategoryItemPageState _state = const MealCategoryItemPageState(
    status: PageState.idle,
  );

  @observable
  String currentCategoryName = '';

  _MealCategoryItemStoreBase(this._getMealsByCategoryUsecase);

  @computed
  MealCategoryItemPageState get state => _state;

  @action
  void _setState(MealCategoryItemPageState newState) => _state = newState;

  @action
  void setCurrentCategoryName(String name) => currentCategoryName = name;

  Future<void> getAllMealsByCategoryName(String categoryName) async {
    try {
      setCurrentCategoryName(categoryName);
      _setState(const MealCategoryItemPageState(status: PageState.loading));

      final responseList = await _getMealsByCategoryUsecase(categoryName);

      _setState(MealCategoryItemPageState(
        status: PageState.success,
        meals: responseList,
      ));
    } catch (_) {
      _setState(
        const MealCategoryItemPageState(status: PageState.failure),
      );
    }
  }
}
