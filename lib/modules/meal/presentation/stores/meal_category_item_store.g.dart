// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_category_item_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MealCategoryItemStore on _MealCategoryItemStoreBase, Store {
  Computed<MealCategoryItemPageState>? _$stateComputed;

  @override
  MealCategoryItemPageState get state => (_$stateComputed ??=
          Computed<MealCategoryItemPageState>(() => super.state,
              name: '_MealCategoryItemStoreBase.state'))
      .value;

  late final _$_stateAtom =
      Atom(name: '_MealCategoryItemStoreBase._state', context: context);

  @override
  MealCategoryItemPageState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(MealCategoryItemPageState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$currentCategoryNameAtom = Atom(
      name: '_MealCategoryItemStoreBase.currentCategoryName', context: context);

  @override
  String get currentCategoryName {
    _$currentCategoryNameAtom.reportRead();
    return super.currentCategoryName;
  }

  @override
  set currentCategoryName(String value) {
    _$currentCategoryNameAtom.reportWrite(value, super.currentCategoryName, () {
      super.currentCategoryName = value;
    });
  }

  late final _$_MealCategoryItemStoreBaseActionController =
      ActionController(name: '_MealCategoryItemStoreBase', context: context);

  @override
  void _setState(MealCategoryItemPageState newState) {
    final _$actionInfo = _$_MealCategoryItemStoreBaseActionController
        .startAction(name: '_MealCategoryItemStoreBase._setState');
    try {
      return super._setState(newState);
    } finally {
      _$_MealCategoryItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCurrentCategoryName(String name) {
    final _$actionInfo = _$_MealCategoryItemStoreBaseActionController
        .startAction(name: '_MealCategoryItemStoreBase.setCurrentCategoryName');
    try {
      return super.setCurrentCategoryName(name);
    } finally {
      _$_MealCategoryItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentCategoryName: ${currentCategoryName},
state: ${state}
    ''';
  }
}
