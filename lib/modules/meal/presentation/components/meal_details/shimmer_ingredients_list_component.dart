import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class ShimmerIngredientsListComponent extends StatelessWidget {
  const ShimmerIngredientsListComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, __) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            children: [
              CRShimmerTile.radiusSquare(
                width: 120,
                height: 25,
                radius: 4,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CRShimmerTile.radiusSquare(
                  width: double.infinity,
                  height: 25,
                  radius: 4,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
