import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/shared/presentation/stores/user_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UserStore _userStore = dependencies<UserStore>();

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () => _userStore.hasUserName
          ? Navigator.of(context).pushNamed(AppRoutes.home)
          : Navigator.of(context).pushNamed(AppRoutes.welcome),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => CRScaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(CRAnimations.loadingFood,
                  repeat: true,
                  width: 150,
                  package: 'cooking_recipes_components'),
            ],
          ),
        ),
      );
}
