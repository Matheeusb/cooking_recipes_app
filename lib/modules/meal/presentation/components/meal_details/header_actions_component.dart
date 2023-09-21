import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HeaderActionsComponent extends StatelessWidget {
  const HeaderActionsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            FeatherIcons.chevronLeft,
            color: CRColors.secondaryText,
          ),
        ),
      );
}
