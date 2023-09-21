import 'package:flutter/widgets.dart';

import '../tokens/sizes.dart';
import 'logo.dart';
import 'text.dart';

/// A custom section header widget designed for use in Flutter applications.
///
/// This widget provides a styled section header with a title and an optional
/// subtitle.
///
/// Example usage:
///
/// ```dart
/// CRSectionHeader(
///   title: 'Recipes',
///   subtitle: 'Explore a variety of delicious dishes.',
///   username: 'John Doe',
/// )
/// ```
///
/// The [CRSectionHeader] widget displays a section header with a specified
/// [title] and an optional [subtitle] below the title. Additionally, you can
/// provide a [username] to associate with the section header.
///
/// This widget is often used to visually group content and provide context
/// within an application.
class CRSectionHeader extends StatelessWidget {
  /// The title to display in the section header.
  final String title;

  /// An optional subtitle to display below the title.
  final String? subtitle;

  /// An optional username to associate with the section header.
  final String? username;

  /// Creates a [CRSectionHeader] widget.
  ///
  /// The [title] parameter is required and specifies the title to be displayed
  /// in the section header.
  ///
  /// The [subtitle] parameter is optional and can be used to provide additional
  /// context or information below the title.
  ///
  /// The [username] parameter is optional and can be used to associate a username
  /// or author's name with the section header.
  const CRSectionHeader({
    required this.title,
    this.subtitle,
    this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (username != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CRText.sm(
                      'Hello,',
                      fontWeight: FontWeight.w300,
                    ),
                    CRText.sm(
                      username!,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                const CRLogo(),
              ],
            ),
            const SizedBox(height: CRSizes.extraLarge),
          ],
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CRText.xxs(
                title,
                fontWeight: FontWeight.w600,
              ),
              Visibility(
                visible: subtitle != null,
                child: CRText.xxxs(subtitle!),
              ),
            ],
          ),
        ],
      );
}
