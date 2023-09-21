/// A collection of animation asset paths for use in Flutter applications.
///
/// This abstract class provides convenient static constants for referencing
/// animation assets used throughout the application.
///
/// Example usage:
///
/// ```dart
/// CRAnimations.foodMarket // Use this constant to reference the food market animation.
/// CRAnimations.loadingFood // Use this constant to reference the loading food animation.
/// ```
abstract class CRAnimations {
  CRAnimations._();

  /// The asset path for the food market animation.
  static const foodMarket = 'assets/animations/food_market.json';

  /// The asset path for the loading food animation.
  static const loadingFood = 'assets/animations/loading_food.json';
}
