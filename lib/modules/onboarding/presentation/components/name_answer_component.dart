import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/widgets.dart';

class NameAnswerComponent extends StatelessWidget {
  const NameAnswerComponent({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        children: <Widget>[
          CRText.lg('😊'),
          SizedBox(height: CRSizes.medium),
          CRText.md(
            'How can \nI call you?',
            textAlign: TextAlign.center,
          ),
        ],
      );
}
