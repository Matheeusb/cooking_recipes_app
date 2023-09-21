import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../meal/presentation/pages/home_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../stores/menu_navigation_store.dart';

class MenuNavigationPage extends StatefulWidget {
  const MenuNavigationPage({Key? key}) : super(key: key);

  @override
  State<MenuNavigationPage> createState() => _MenuNavigationPageState();
}

class _MenuNavigationPageState extends State<MenuNavigationPage> {
  final MenuNavigationStore _store = dependencies<MenuNavigationStore>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _store.pageController,
        onPageChanged: _store.setCurrentPage,
        children: const <Widget>[
          HomePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: theme.highlightColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () => _store.toPage(0),
                  icon: const Icon(FeatherIcons.home),
                  color: _store.currentPage == 0
                      ? theme.primaryColor
                      : CRColors.secondaryText,
                ),
                IconButton(
                  onPressed: () => _store.toPage(1),
                  icon: const Icon(FeatherIcons.settings),
                  color: _store.currentPage == 1
                      ? theme.primaryColor
                      : CRColors.secondaryText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
