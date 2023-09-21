import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'core/dependency_injection/injection.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
import 'core/shared/presentation/stores/user_store.dart';

class CookingRecipesApp extends StatefulWidget {
  const CookingRecipesApp({super.key});

  @override
  State<CookingRecipesApp> createState() => _CookingRecipesAppState();
}

class _CookingRecipesAppState extends State<CookingRecipesApp> {
  final UserStore _userStore = dependencies<UserStore>();

  @override
  Widget build(BuildContext context) => Observer(
        builder: (_) => MaterialApp(
          title: 'Cooking Recipes App',
          debugShowCheckedModeBanner: false,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          themeMode: _userStore.userData.useDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: AppRoutes.initial,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );
}
