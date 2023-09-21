import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class ShimmerGridItemsComponent extends StatelessWidget {
  const ShimmerGridItemsComponent({super.key});

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (_, __) => Column(
          children: [
            CRShimmerTile.radiusSquare(
              width: 120,
              height: 120,
            ),
            const SizedBox(height: CRSizes.extraSmall),
            CRShimmerTile.radiusSquare(
              width: 100,
              height: 10,
              radius: 2,
            ),
          ],
        ),
      );
}
