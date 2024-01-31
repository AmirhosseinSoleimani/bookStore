

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class AccessCheckBox<E extends Enum> extends FormzInput<Set<E>, AccessCheckBoxValidationError> with EquatableMixin {

  const AccessCheckBox.pure([String value = '']) : super.pure(const {});

  const AccessCheckBox.dirty(Set<E> values) : super.dirty(values);

  @override
  List<Object?> get props => [value, isPure];

  @override
  AccessCheckBoxValidationError? validator(Set<E> value) {
    value.isEmpty ? AccessCheckBoxValidationError.empty : null;
  }

}


enum AccessCheckBoxValidationError { empty }