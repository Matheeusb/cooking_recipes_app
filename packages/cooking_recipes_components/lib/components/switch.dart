import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

/// A custom switch widget designed for use in Flutter applications.
///
/// This widget provides a switch with a label typically used for toggling
/// a boolean setting in your application.
///
/// Example usage:
///
/// ```dart
/// CRSwitch(
///   label: 'Enable Notifications',
///   value: isNotificationsEnabled,
///   onChanged: (newValue) {
///     // Handle the toggle change here
///   },
/// )
/// ```
///
/// The [CRSwitch] widget displays a switch with a label that describes the
/// purpose of the switch. The switch's state is controlled by the [value] property,
/// and changes are reported back to the parent using the [onChanged] callback.
///
/// This widget is useful for allowing users to enable or disable specific
/// settings or features in your application.
class CRSwitch extends StatelessWidget {
  /// The label displayed next to the switch.
  final String label;

  /// The current state of the switch (true for "on", false for "off").
  final bool value;

  /// A callback function that is called when the switch's state is changed.
  final Function(bool)? onChanged;

  /// Creates a [CRSwitch] widget.
  ///
  /// The [label] parameter is required and specifies the text displayed next
  /// to the switch.
  ///
  /// The [value] parameter is required and controls the state of the switch.
  ///
  /// The [onChanged] parameter is optional and is called when the switch's
  /// state is changed. It provides the new state of the switch.
  const CRSwitch({
    required this.label,
    required this.value,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SwitchListTile.adaptive(
        value: value,
        contentPadding: const EdgeInsets.all(0),
        onChanged: onChanged,
        activeTrackColor: CRColors.secondary,
        activeColor: CRColors.primary,
        title: CRText.xxs(label),
      );
}
