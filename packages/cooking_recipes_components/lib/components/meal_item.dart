import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

/// A custom meal item widget designed for use in Flutter applications.
///
/// This widget provides a visual representation of a meal item, typically
/// used to display images and descriptions of meals.
///
/// Example usage:
///
/// ```dart
/// CRMealItem(
///   imageUrl: 'https://example.com/meal.jpg',
///   description: 'Delicious Pasta',
///   isDetail: true,
/// )
/// ```
///
/// The [CRMealItem] widget displays an image and a description of a meal.
/// It is often used in lists or grids to present a collection of meal items.
///
/// The [imageUrl] parameter is required and specifies the URL of the meal's
/// image.
///
/// The [description] parameter is required and provides a textual description
/// of the meal.
///
/// The [isDetail] parameter is optional and, when set to `true`, uses a larger
/// font size for the description, making it suitable for detailed meal views.
class CRMealItem extends StatelessWidget {
  /// The URL of the meal's image.
  final String imageUrl;

  /// A textual description of the meal.
  final String description;

  /// Determines whether the description should be displayed in a larger font size.
  final bool isDetail;

  /// Creates a [CRMealItem] widget.
  ///
  /// The [imageUrl] parameter is required and specifies the URL of the meal's
  /// image.
  ///
  /// The [description] parameter is required and provides a textual description
  /// of the meal.
  ///
  /// The [isDetail] parameter is optional and, when set to `true`, uses a larger
  /// font size for the description, making it suitable for detailed meal views.
  const CRMealItem({
    required this.imageUrl,
    required this.description,
    this.isDetail = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(CRSizes.extraSmall),
              child: Image.network(imageUrl),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: CRSizes.extraSmall),
            child: isDetail
                ? CRText.xs(
                    description,
                    fontWeight: FontWeight.bold,
                  )
                : CRText.xxxs(description),
          ),
        ],
      );
}
