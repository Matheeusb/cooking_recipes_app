import 'package:flutter/widgets.dart';

import '../tokens/colors.dart';

/// A custom logo widget designed for use in Flutter applications.
///
/// This widget provides a logo or icon typically used to represent the
/// application or organization's branding.
///
/// Example usage:
///
/// ```dart
/// CRLogo()
/// ```
///
/// The [CRLogo] widget displays a circular logo with a fixed size of 40x40
/// pixels and a background color defined by the [CRColors.primary] value.
/// You can customize the appearance and behavior of this widget as needed.
///
/// This widget is often used as a visual representation of the application's
/// logo or branding.
class CRLogo extends StatelessWidget {
  
  /// Creates a [CRLogo] widget.
  ///
  /// The [key] parameter can be used to specify a custom [Key] to identify
  /// this widget.
  const CRLogo({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: CRColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
      );
}
