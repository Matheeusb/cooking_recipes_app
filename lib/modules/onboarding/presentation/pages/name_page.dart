import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';

import '../components/name_answer_component.dart';
import '../components/name_form_component.dart';

class NamePage extends StatelessWidget {
  const NamePage({super.key});

  @override
  Widget build(BuildContext context) => const CRScaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: CRSizes.extraLarge),
          NameAnswerComponent(),
          SizedBox(height: CRSizes.huge),
          NameFormComponent(),
        ],
      ),
    );
}
