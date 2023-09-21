import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

/// A custom scaffold widget designed for use in Flutter applications.
///
/// This widget provides a customized scaffold with safe area and padding,
/// typically used as a layout container for building app screens.
///
/// Example usage:
///
/// ```dart
/// CRScaffold(
///   body: MyCustomWidget(),
/// )
/// ```
///
/// The [CRScaffold] widget is a convenient way to create a scaffold with a
/// specified `body` widget, ensuring that it is placed within a safe area and
/// includes padding for consistent layout and spacing.
///
/// The `body` parameter is required and specifies the main content widget that
/// should be displayed within the scaffold.
class CRScaffold extends StatelessWidget {
  /// The main content widget to be displayed within the scaffold.
  final Widget body;

  /// Creates a [CRScaffold] widget.
  ///
  /// The [body] parameter is required and specifies the main content widget
  /// that should be displayed within the scaffold.
  const CRScaffold({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CRSizes.small,
              vertical: CRSizes.medium,
            ),
            child: body,
          ),
        ),
      );
}
