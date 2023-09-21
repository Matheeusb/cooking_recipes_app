import 'package:cooking_recipes_components/cooking_recipes_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/shared/presentation/stores/user_store.dart';
import '../stores/name_form_store.dart';

@injectable
class NameFormComponent extends StatefulWidget {
  const NameFormComponent({super.key});

  @override
  State<NameFormComponent> createState() => _NameFormComponentState();
}

class _NameFormComponentState extends State<NameFormComponent> {
  final NameFormStore _formStore = dependencies<NameFormStore>();
  final UserStore _userStore = dependencies<UserStore>();

  @override
  void initState() {
    super.initState();
    _formStore.setupValidations();
  }

  @override
  void dispose() {
    _formStore.dispose();
    super.dispose();
  }

  void _navigate() {
    _userStore.setData(name: _formStore.name);
    Navigator.of(context).pushNamed(AppRoutes.home);
  }

  void _onTap() {
    if (_formStore.name.isEmpty) {
      _formStore.setError(
        message: 'I would like to know your name, it could be a nickname 😁',
      );
    }
  }

  @override
  Widget build(BuildContext context) => Observer(
        builder: (context) => Column(
          children: <Widget>[
            CRTextField(
              onChanged: _formStore.setName,
              label: 'Type your name',
              errorText: _formStore.error.name,
              textInputAction: TextInputAction.done,
              autoFocus: true,
              maxLength: 20,
              hasError: _formStore.error.hasNameError,
            ),
            const SizedBox(height: CRSizes.huge),
            GestureDetector(
              onTap: _onTap,
              child: CRButton(
                label: 'Next',
                onPressed: _formStore.valid ? _navigate : null,
              ),
            )
          ],
        ),
      );
}
