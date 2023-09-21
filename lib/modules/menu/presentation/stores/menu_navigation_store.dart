import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'menu_navigation_store.g.dart';

@Singleton()
class MenuNavigationStore = _MenuNavigationStoreBase with _$MenuNavigationStore;

abstract class _MenuNavigationStoreBase with Store {
  @observable
  int _currentPage = 0;

  @action
  void setCurrentPage(int value) => _currentPage = value;

  @computed
  get currentPage => _currentPage;

  final pageController = PageController(initialPage: 0);

  void toPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );

    setCurrentPage(pageIndex);
  }
}
