import 'package:cooking_recipes_app/modules/menu/presentation/stores/menu_navigation_store.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPageController extends Mock implements PageController {}

void main() {
  late MenuNavigationStore store;

  setUp(() {
    store = MenuNavigationStore();
  });

  test('Should get inital currentPage with index 0', () {
    expect(store.currentPage, 0);
  });

  test('Should set currentPage and get the same', () {
    store.setCurrentPage(1);
    expect(store.currentPage, 1);
  });
}
