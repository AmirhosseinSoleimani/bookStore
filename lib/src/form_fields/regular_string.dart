
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class RegularString extends FormzInput<String, RegularStringValidationError> with EquatableMixin {

  const RegularString.pure([String value = '']) : super.pure(value);

  const RegularString.dirty(String value) : super.dirty(value);

  @override
  List<Object?> get props => [value, isPure];

  @override
  RegularStringValidationError? validator(String value) {
    return value.isEmpty ? RegularStringValidationError.empty : null;
  }

}



enum RegularStringValidationError {
  empty,
}
