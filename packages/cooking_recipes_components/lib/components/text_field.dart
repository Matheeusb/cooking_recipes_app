import 'package:flutter/material.dart';

/// A custom text field widget designed for use in Flutter applications.
///
/// This widget provides a customizable text input field with various options
/// for customization, including autofocus, error handling, and more.
///
/// Example usage:
///
/// ```dart
/// CRTextField(
///   label: 'Username',
///   hint: 'Enter your username',
///   onChanged: (value) {
///     // Handle text field value changes
///   },
///   errorText: _isError ? 'Invalid username' : null,
/// )
/// ```
///
/// The [label] parameter is required and specifies the label for the text field.
///
/// Other parameters, such as [hint], [errorText], [maxLength], [enabled], and
/// more, allow you to customize the behavior and appearance of the text field.
///
/// This widget is built on top of Flutter's `TextField` and provides
/// additional customization options for text input fields in your app.
class CRTextField extends StatelessWidget {
  /// Whether the text field should be automatically focused when it appears.
  final bool autoFocus;

  /// Whether autocorrect should be enabled for the text field.
  final bool autocorrect;

  /// The label to display above the text field.
  final String label;

  /// A hint text to display inside the text field when it's empty.
  final String? hint;

  /// The error text to display below the text field when there is an error.
  final String? errorText;

  /// Whether the text field is enabled or disabled.
  final bool? enabled;

  /// The keyboard type to use for the text field's input.
  final TextInputType? keyboardType;

  /// The action to take when the user presses the action button on the keyboard.
  final TextInputAction? textInputAction;

  /// A callback function that is called when the text in the field changes.
  final ValueChanged<String>? onChanged;

  /// A callback function that is called when the user completes editing.
  final VoidCallback? onEditingComplete;

  /// A controller for the text field to manage its text value.
  final TextEditingController? controller;

  /// The maximum length of the input allowed in the text field.
  final int? maxLength;

  /// Whether the text field has an error state.
  final bool? hasError;

  /// The initial value to populate the text field with.
  final String? initialValue;

  /// Creates a [CRTextField] widget.
  ///
  /// The [label] parameter is required, and other parameters are optional.
  const CRTextField({
    required this.label,
    this.autoFocus = false,
    this.autocorrect = false,
    this.hint,
    this.errorText,
    this.enabled,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
    this.maxLength,
    this.hasError,
    this.initialValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Center(
            child: Text(label),
          ),
          hintText: hint,
          errorText: errorText,
          counterText: '',
        ),
        maxLength: maxLength,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        enabled: enabled,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        autofocus: autoFocus,
        autocorrect: autocorrect,
      );
}
