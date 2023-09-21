import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/shared/presentation/stores/user_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final UserStore _store = dependencies<UserStore>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Observer(
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: CRSizes.extraLarge),
                  const Center(
                    child: CRLogo(),
                  ),
                  const SizedBox(height: CRSizes.micro),
                  Center(
                    child: CRText.xxs(
                      _store.userData.name,
                      fontWeight: FontWeight.bold,
                      color: _store.userData.useDarkMode
                          ? CRColors.white
                          : CRColors.text,
                    ),
                  ),
                  const SizedBox(height: CRSizes.medium),
                  const CRSectionHeader(
                    title: 'Settings',
                    subtitle:
                        'Here you can change your app settings.',
                  ),
                  const SizedBox(height: CRSizes.mega),
                  CRSwitch(
                    label: 'Use dark mode',
                    value: _store.userData.useDarkMode,
                    onChanged: (value) => _store.setData(
                      name: _store.userData.name,
                      useDarkMode: value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
