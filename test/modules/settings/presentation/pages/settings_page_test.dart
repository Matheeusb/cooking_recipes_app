import 'package:cooking_recipes_app/core/dependency_injection/injection.dart';
import 'package:cooking_recipes_app/modules/settings/presentation/pages/settings_page.dart';
import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/app_mock.dart';

void main() {
  late Widget page;

  setUpAll(() {
    configureInjection();
  });

  setUp(() {
    page = const SettingsPage();
  });

  testWidgets('Should display components when SettingsPage is opened',
      (widgetTester) async {
    await widgetTester.pumpWidget(AppMock(child: page));
    await widgetTester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Here you can change your app settings.'), findsOneWidget);
    expect(find.text('Use dark mode'), findsOneWidget);
    expect(find.byType(CRSwitch), findsOneWidget);
    expect(find.byType(CRSectionHeader), findsOneWidget);
  });

  testWidgets('Should update switch state when CRSwitch is tapped',
      (widgetTester) async {
    await widgetTester.pumpWidget(AppMock(child: page));
    await widgetTester.pumpAndSettle();

    final Finder crSwitch = find.byType(CRSwitch);
    await widgetTester.tap(crSwitch);
    await widgetTester.pumpAndSettle();

    final CRSwitch crSwitchWidget = widgetTester.firstWidget(crSwitch);

    expect(crSwitchWidget.value, true);
  });
}
