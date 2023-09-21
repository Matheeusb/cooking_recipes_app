import 'package:cooking_recipes_app/modules/meal/domain/entities/meal.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/shared/presentation/states/page_state.dart';
import '../../domain/usecases/get_meal_by_id_usecase.dart';
import '../states/meal_detail_page_state.dart';

part 'meal_detail_store.g.dart';

@singleton
class MeaDetailStore = _MeaDetailStoreBase with _$MeaDetailStore;

abstract class _MeaDetailStoreBase with Store {
  final GetMealByIdUsecase _getMealByIdUsecase;

  @observable
  MealDetailPageState _state =
      const MealDetailPageState(status: PageState.idle);

  _MeaDetailStoreBase(this._getMealByIdUsecase);

  @action
  void _setState(MealDetailPageState newState) => _state = newState;

  @computed
  MealDetailPageState get state => _state;

  Future<void> getMealByID(String id) async {
    try {
      _setState(const MealDetailPageState(status: PageState.loading));

      final Meal meal = await _getMealByIdUsecase(id);

      _setState(MealDetailPageState(status: PageState.success, meal: meal));
    } catch (_) {
      _setState(const MealDetailPageState(status: PageState.failure));
    }
  }
}
