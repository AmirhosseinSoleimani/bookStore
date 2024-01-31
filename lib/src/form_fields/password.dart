
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class Password extends FormzInput<String, PasswordValidationError> with EquatableMixin {
  @override
  const Password.pure([String value = '']) : super.dirty(value);
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if(value.isEmpty) {
      return PasswordValidationError.empty;
    }else if (value.length < 5 ) {
      return PasswordValidationError.invalidLength;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [isPure, isValid, value];
}

enum PasswordValidationError {
  empty,
  invalidLength,
}