import 'package:flutter/material.dart';

/// A custom button widget designed for use in Flutter applications.
///
/// This widget provides a customizable button that can display either a label
/// or a child widget. It is typically used to create buttons with custom
/// styling and functionality.
///
/// Example usage:
///
/// ```dart
/// CRButton(
///   onPressed: () {
///     // Add your button's onPressed logic here
///   },
///   label: 'Click Me',
///   // or
///   child: Icon(Icons.star),
/// )
/// ```
///
/// The `onPressed` callback is required to handle button taps.
///
/// If you provide a `label`, it will be displayed as the button's text. If you
/// provide a `child`, it will be displayed as the button's content, allowing
/// for more complex button designs.
///
/// This widget is built on top of Flutter's `ElevatedButton` and provides
/// additional customization options for buttons in your app.
class CRButton extends StatelessWidget {
  /// A callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// The label to display on the button. If provided, this will be displayed
  /// as the button's text.
  final String? label;

  /// A child widget to display on the button. If provided, this widget will be
  /// displayed as the button's content.
  final Widget? child;

  /// Creates a [CRButton] widget.
  ///
  /// The [onPressed] and either [label] or [child] must be provided.
  ///
  /// The [key] parameter can be used to specify a custom [Key] to identify
  /// this widget.
  const CRButton({
    this.onPressed,
    this.label,
    this.child,
    super.key,
  });

  /// Returns `true` if a [label] is provided for this button.
  bool get _hasLabel => label != null;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: _hasLabel
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    label!,
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : child,
      );
}
