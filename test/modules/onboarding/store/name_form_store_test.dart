import 'package:cooking_recipes_app/modules/onboarding/presentation/stores/name_form_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NameFormStore store;

  setUp(() {
    store = NameFormStore();
  });

  group('NameFormStore', () {
    test('Should set/get name propertie from state', () {
      store.setName('User Test');
      expect(store.name, equals('User Test'));
    });

    test('Should verify when store has an error', () {
      expect(store.valid, equals(false));
    });

    test('Should validate when name is valid', () {
      store.validateName('User Test');
      expect(store.error.hasNameError, equals(false));
    });

    test('Should validate when name is invalid', () {
      store.validateName('Us');

      expect(store.error.hasNameError, equals(true));
    });

    test('Shoud clear all form values', () {
      store.setName('User Test');
      store.clear();

      expect(store.valid, equals(false));
    });

    test('Should call dispose method and reset store values', () {
      store.setupValidations();
      store.dispose();

      expect(store.valid, equals(false));
    });
  });

  group('NameFormErrorState', () {
    const errorMessage = 'Any name error message';

    test(
      'shoud verify if setError on name call correct method and set the errormessage when receives a message',
      () {
        store.setError(message: errorMessage);

        expect(store.error.name, equals(errorMessage));
        expect(store.error.hasNameError, equals(true));
      },
    );
  });
}
