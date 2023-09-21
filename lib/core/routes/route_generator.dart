import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import '../../modules/meal/domain/entities/meal_category_item.dart';
import '../../modules/meal/presentation/pages/meal_details_page.dart';
import '../../modules/menu/presentation/pages/menu_navigation_page.dart';
import '../../modules/onboarding/presentation/pages/name_page.dart';
import '../../modules/onboarding/presentation/pages/splash_page.dart';
import '../../modules/onboarding/presentation/pages/welcome_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    return switch (settings.name) {
      AppRoutes.initial => MaterialPageRoute(
          builder: (_) => const SplashPage(),
        ),
      AppRoutes.welcome => MaterialPageRoute(
          builder: (_) => const WelcomePage(),
        ),
      AppRoutes.name => MaterialPageRoute(
          builder: (_) => const NamePage(),
        ),
      AppRoutes.home => MaterialPageRoute(
          builder: (_) => const MenuNavigationPage(),
        ),
      AppRoutes.mealDetail => MaterialPageRoute(
          builder: (_) => MealDetailsPage(meal: args as MealCategoryItem),
        ),
      _ => _errorRoute(),
    };
  }

  static Route<dynamic> _errorRoute() => MaterialPageRoute(
        builder: (_) => const CRScaffold(
          body: Center(
            child: CRText.xxs('Route not found. 😕'),
          ),
        ),
      );
}
