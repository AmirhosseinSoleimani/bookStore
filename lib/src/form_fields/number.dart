
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class RegularDigits extends FormzInput<String, RegularDigitsError> with EquatableMixin {

  const RegularDigits.pure([String value = '']) : super.pure(value);
  const RegularDigits.dirty(String value) : super.dirty(value);

  @override
  List<Object?> get props => [value, isPure];

  @override
  RegularDigitsError? validator(String value) {
    final digitOnlyRegex = RegExp(r'(^[0-9]+$)');
    final digitLength = RegExp(r'(.{4,})');
    if(value.isEmpty) {
      return RegularDigitsError.empty;
    } else if (!digitOnlyRegex.hasMatch(value)) {
      return RegularDigitsError.inValidDigits;
    } else if (!digitLength.hasMatch(value)) {
      return RegularDigitsError.inValidLength;
    }
    return null;
  }

}


enum RegularDigitsError { empty, inValidDigits, inValidLength }