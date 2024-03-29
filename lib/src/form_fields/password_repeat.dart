
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class PasswordRepeat extends FormzInput<String, PasswordRepeatValidationError> with EquatableMixin {

  const PasswordRepeat.pure({String value = '', this.newPassword = ''}) : super.pure(value);

  const PasswordRepeat.dirty(String value, {required this.newPassword}) : super.dirty(value);

  final String newPassword;

  @override
  List<Object?> get props => [newPassword, isPure, isValid, value];

  @override
  validator(String value) {
    if(value.isEmpty) {
      return PasswordRepeatValidationError.empty;
    } else if (value != newPassword) {
      return PasswordRepeatValidationError.invalidMatch;
    } else {
      return null;
    }
  }

}

enum PasswordRepeatValidationError {
  empty,
  invalidMatch
}