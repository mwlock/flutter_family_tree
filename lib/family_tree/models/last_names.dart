import 'package:formz/formz.dart';

enum LastNamesValidationError { invalid }

class LastNames extends FormzInput<String, LastNamesValidationError> {
  const LastNames.pure() : super.pure('');
  const LastNames.dirty([String value = '']) : super.dirty(value);

  // static final RegExp _emailRegExp = RegExp(
  //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // );

  @override
  LastNamesValidationError validator(String value) {
    return (!(value.isEmpty || value == null))
        ? null
        : LastNamesValidationError.invalid;
  }
}
