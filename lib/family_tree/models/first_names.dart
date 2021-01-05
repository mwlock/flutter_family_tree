import 'package:formz/formz.dart';

enum FirstNamesValidationError { invalid }

class FirstNames extends FormzInput<String, FirstNamesValidationError> {
  const FirstNames.pure() : super.pure('');
  const FirstNames.dirty([String value = '']) : super.dirty(value);

  // static final RegExp _emailRegExp = RegExp(
  //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // );

  @override
  FirstNamesValidationError validator(String value) {
    return (!(value.isEmpty || value == null))
        ? null
        : FirstNamesValidationError.invalid;
  }
}
