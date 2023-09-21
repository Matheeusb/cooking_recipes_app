import 'package:cooking_recipes_app/core/dependency_injection/injection.dart';
import 'package:cooking_recipes_app/modules/onboarding/presentation/pages/splash_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';

import '../../../../mocks/app_mock.dart';

void main() {
  setUpAll(() {
    configureInjection();
  });

  testWidgets('Should display lottie component when SplashPage is opened',
      (widgetTester) async {
    await widgetTester.pumpWidget(const AppMock(child: SplashPage()));
    await widgetTester.pumpAndSettle();

    expect(find.byType(Lottie), findsOneWidget);
  });
}
