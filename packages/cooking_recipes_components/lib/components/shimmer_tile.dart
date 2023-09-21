import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// A custom shimmering tile widget designed for use in Flutter applications.
///
/// This widget provides a shimmering effect typically used to indicate loading
/// or placeholder content in your application.
///
/// Example usage:
///
/// ```dart
/// CRShimmerTile.circular(
///   width: 100,
///   height: 100,
///   radius: 50,
/// )
/// ```
///
/// The [CRShimmerTile] widget displays a shimmering effect within a rectangular
/// or circular tile with a specified [width] and [height]. You can customize
/// the shape of the tile using the provided constructors like [circular] and
/// [radiusSquare].
///
/// This widget is often used to create loading placeholders for images or other
/// content while data is being fetched.
class CRShimmerTile extends StatelessWidget {
  /// The width of the shimmering tile.
  final double width;

  /// The height of the shimmering tile.
  final double height;

  /// The shape border of the tile.
  final ShapeBorder shapeBorder;

  /// The radius for rounded corners, if applicable.
  final double? radius;

  /// Creates a [CRShimmerTile] widget with a circular shape.
  ///
  /// The [width] and [height] parameters are required to specify the size of
  /// the tile.
  ///
  /// The [radius] parameter can be used to specify the radius for rounded
  /// corners, but it is optional.
  CRShimmerTile.circular({
    Key? key,
    required this.width,
    required this.height,
    this.radius,
  })  : shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        super(key: key);

  /// Creates a [CRShimmerTile] widget with a rectangular shape and rounded corners.
  ///
  /// The [width] and [height] parameters are required to specify the size of
  /// the tile.
  ///
  /// The [radius] parameter can be used to specify the radius for rounded
  /// corners, but it is optional.
  CRShimmerTile.radiusSquare({
    required this.width,
    required this.height,
    this.radius,
    super.key,
  }) : shapeBorder = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 15),
        );

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[400]!,
        period: const Duration(seconds: 3),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            shape: shapeBorder,
            color: Colors.grey[400],
          ),
        ),
      );
}
