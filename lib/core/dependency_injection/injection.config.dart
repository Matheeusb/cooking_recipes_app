// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cooking_recipes_app/core/http/http_client.dart' as _i3;
import 'package:cooking_recipes_app/core/http/http_client_impl.dart' as _i4;
import 'package:cooking_recipes_app/core/shared/presentation/stores/user_store.dart'
    as _i13;
import 'package:cooking_recipes_app/modules/meal/data/datasources/meal_datasource.dart'
    as _i5;
import 'package:cooking_recipes_app/modules/meal/data/datasources/meal_datasource_impl.dart'
    as _i6;
import 'package:cooking_recipes_app/modules/meal/data/repositories/meal_repository_impl.dart'
    as _i8;
import 'package:cooking_recipes_app/modules/meal/domain/repositories/meal_repository.dart'
    as _i7;
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_all_meal_categories_usecase.dart'
    as _i14;
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meal_by_id_usecase.dart'
    as _i15;
import 'package:cooking_recipes_app/modules/meal/domain/usecases/get_meals_by_category_usecase.dart'
    as _i16;
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_category_item_store.dart'
    as _i18;
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_category_store.dart'
    as _i19;
import 'package:cooking_recipes_app/modules/meal/presentation/stores/meal_detail_store.dart'
    as _i17;
import 'package:cooking_recipes_app/modules/menu/presentation/stores/menu_navigation_store.dart'
    as _i9;
import 'package:cooking_recipes_app/modules/onboarding/presentation/components/name_form_component.dart'
    as _i10;
import 'package:cooking_recipes_app/modules/onboarding/presentation/stores/name_form_store.dart'
    as _i12;
import 'package:flutter/material.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.HttpClient>(() => _i4.HttpClientImpl());
    gh.factory<_i5.MealDatasource>(
        () => _i6.MealDatasourceImpl(gh<_i3.HttpClient>()));
    gh.factory<_i7.MealRepository>(
        () => _i8.MealRepositoryImpl(gh<_i5.MealDatasource>()));
    gh.singleton<_i9.MenuNavigationStore>(_i9.MenuNavigationStore());
    gh.factory<_i10.NameFormComponent>(
        () => _i10.NameFormComponent(key: gh<_i11.Key>()));
    gh.singleton<_i12.NameFormStore>(_i12.NameFormStore());
    gh.singleton<_i13.UserStore>(_i13.UserStore());
    gh.factory<_i14.GetAllMealCategoriesUsecase>(
        () => _i14.GetAllMealCategoriesUsecase(gh<_i7.MealRepository>()));
    gh.factory<_i15.GetMealByIdUsecase>(
        () => _i15.GetMealByIdUsecase(gh<_i7.MealRepository>()));
    gh.factory<_i16.GetMealsByCategoryUsecase>(
        () => _i16.GetMealsByCategoryUsecase(gh<_i7.MealRepository>()));
    gh.singleton<_i17.MeaDetailStore>(
        _i17.MeaDetailStore(gh<_i15.GetMealByIdUsecase>()));
    gh.singleton<_i18.MealCategoryItemStore>(
        _i18.MealCategoryItemStore(gh<_i16.GetMealsByCategoryUsecase>()));
    gh.singleton<_i19.MealCategoryStore>(
        _i19.MealCategoryStore(gh<_i14.GetAllMealCategoriesUsecase>()));
    return this;
  }
}
