import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../tokens/colors.dart';

/// A custom refresh button widget designed for use in Flutter applications.
///
/// This widget provides a refresh button typically used to trigger a data
/// refresh action in your application.
///
/// Example usage:
///
/// ```dart
/// CRRefreshButton(
///   onPressed: () {
///     // Add your refresh logic here
///   },
/// )
/// ```
///
/// The [CRRefreshButton] widget displays an icon button with the FeatherIcons
/// "refresh-cw" icon and a customizable [onPressed] callback. You can specify
/// the [onPressed] callback to define the action to be taken when the button
/// is pressed.
///
/// This widget is often used in conjunction with data refreshing functionality.
class CRRefreshButton extends StatelessWidget {
  /// A callback function that is called when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a [CRRefreshButton] widget.
  ///
  /// The [onPressed] parameter is required to handle button taps.
  ///
  /// The [key] parameter can be used to specify a custom [Key] to identify
  /// this widget.
  const CRRefreshButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        color: CRColors.surface,
        icon: const Icon(
          FeatherIcons.refreshCw,
          color: CRColors.primary,
        ),
      );
}
