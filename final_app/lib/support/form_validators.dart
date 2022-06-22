import 'package:flutter/material.dart';

abstract class FormValidators {
  static final FormFieldValidator required = (value) {
    if (value.isEmpty) {
      return 'This field is required';
    }
    return null;
  };

  static final FormFieldValidator Function(num) greaterThan = (greaterThan) {
    return (value) {
      final numValue = num.tryParse(value);
      if (numValue == null || numValue <= greaterThan) {
        return 'Value should be at greater than $greaterThan';
      }

      return null;
    };
  };
}
