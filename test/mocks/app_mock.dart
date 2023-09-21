import 'package:cooking_recipes_app/core/routes/route_generator.dart';
import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class AppMock extends StatefulWidget {
  final Widget child;

  const AppMock({
    required this.child,
    super.key,
  });

  @override
  State<AppMock> createState() => _AppMockState();
}

class _AppMockState extends State<AppMock> {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightThemeData,
    onGenerateRoute: RouteGenerator.generateRoute,
    home: widget.child,
  );
}
