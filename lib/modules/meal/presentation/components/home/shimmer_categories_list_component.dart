import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class ShimmerCategoriesListComponent extends StatelessWidget {
  const ShimmerCategoriesListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5));

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 5),
        child: CRShimmerTile.radiusSquare(width: 90, height: 100),
      ),
    );
  }
}
