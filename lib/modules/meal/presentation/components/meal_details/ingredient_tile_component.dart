import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

class IngredientTileComponent extends StatefulWidget {
  final String thumbUrl;
  final String title;
  final String measure;
  final ValueChanged<bool?>? onChanged;
  final bool isChecked;

  const IngredientTileComponent({
    required this.thumbUrl,
    required this.title,
    required this.measure,
    this.isChecked = false,
    this.onChanged,
    super.key,
  });

  @override
  State<IngredientTileComponent> createState() =>
      _IngredientTileComponentState();
}

class _IngredientTileComponentState extends State<IngredientTileComponent> {
  bool _isChecked = false;

  void _onChanged(bool? value) => setState(() => _isChecked = !_isChecked);

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Image.network(
            width: 20,
            widget.thumbUrl,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
          Expanded(
            child: ListTile(
              title: CRText.xxs(
                widget.title,
                textDecoration: _isChecked ? TextDecoration.lineThrough : null,
              ),
              trailing: CRText.xxs(
                widget.measure,
                textDecoration: _isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          Checkbox(
            value: _isChecked,
            onChanged: _onChanged,
          ),
        ],
      );
}
