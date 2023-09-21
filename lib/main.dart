import 'package:flutter/widgets.dart';

import '../app.dart';
import 'core/dependency_injection/injection.dart';

void main() {
  configureInjection();

  runApp(const CookingRecipesApp());
}
