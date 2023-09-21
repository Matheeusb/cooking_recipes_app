import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'name_form_store.g.dart';

@Singleton()
class NameFormStore = _NameFormStoreBase with _$NameFormStore;

abstract class _NameFormStoreBase with Store {
  final NameFormErrorState error = NameFormErrorState();

  late ReactionDisposer _disposer;

  @observable
  String name = '';

  @computed
  bool get valid => name.isNotEmpty;

  @action
  void setName(String value) => name = value;

  @action
  void clear() {
    name = '';
    error.clearAll();
  }

  @action
  void validateName(String value) {
    if (value.length < 3) {
      error.name = 'Your name must be at least 3 characters long';
      return;
    }

    error.name = null;
  }

  @action
  void setError({String? message}) => error.setNameError(message);

  void setupValidations() => _disposer = reaction((_) => name, validateName);

  void dispose() {
    clear();
    _disposer();
  }
}

class NameFormErrorState = _NameFormErrorState with _$NameFormErrorState;

abstract class _NameFormErrorState with Store {
  @observable
  String? name;

  @computed
  bool get hasNameError => name != null;

  @action
  void setNameError(String? error) => name = error;

  @action
  void clearAll() => name = null;
}
