import 'package:cooking_recipes_app/core/dependency_injection/injection.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/pages/welcome_page.dart';
import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

import '../../../../mocks/app_mock.dart';

void main() {
  setUpAll(() {
    configureInjection();
  });

  testWidgets('Should display components when WelcomePage is opened',
      (widgetTester) async {
    await widgetTester.pumpWidget(const AppMock(child: WelcomePage()));
    await widgetTester.pumpAndSettle();

    expect(find.text('Make your own \nrecipes easily'), findsOneWidget);
    expect(find.byType(Lottie), findsOneWidget);
    expect(
        find.text(
            'Find that delicious recipe from \naround the world to make for \nyourself or your family.'),
        findsOneWidget);
    expect(find.byType(CRButton), findsOneWidget);
    expect(find.byType(CRText), findsNWidgets(2));
  });
}
