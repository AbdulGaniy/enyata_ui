import 'package:flutter/material.dart';
import 'package:validators2/sanitizers.dart';
import 'package:validators2/validators2.dart';

import '../categories/inputs/app_text_field/text_field.dart';
import 'string_conditions.dart';

class Validators {
  static FormFieldValidator email(
      [String errorText = 'This field must be an email']) {
    return (value) {
      if (!isEmail(trim(value))) return errorText;
      return null;
    };
  }

  static FormFieldValidator notRequired() {
    return (value) {
      return null;
    };
  }

  static FormFieldValidator required(
      {String errorText = 'Required', String? name}) {
    return (value) {
      if (trim(value).isEmpty) return name != null ? 'Enter $name' : errorText;
      return null;
    };
  }

  static FormFieldValidator isValidUserId(
      {String errorText = 'Enter a valid email or phoneNumber', String? name}) {
    return (value) {
      if (!isEmail(trim(value)) && !isNumeric(trim(value))) return errorText;
      return null;
    };
  }

  static FormFieldValidator min(int min, String name) {
    return (value) {
      if (value.toString().length < min) {
        return 'must be at least $min characters';
      }
      return null;
    };
  }

  static FormFieldValidator password({String? errorText}) {
    return (value) {
      if (value.toString().length < 6) {
        return errorText ?? 'must be at least 6 characters';
      }
      return null;
    };
  }

  static FormFieldValidator confirmPassword(
    PageTextManager page, {
    String? errorText,
  }) {
    return (value) {
      if (page.field('password').text != value) {
        return errorText ?? "Doesn't match";
      }
      return null;
    };
  }

  static FormFieldValidator pin() {
    return min(4, 'pin');
  }

  static FormFieldValidator confirmPin(PageTextManager page, String pinKey) {
    return (value) {
      if (page.field(pinKey).text != value) {
        return "Doesn't match";
      }
      return null;
    };
  }

  static FormFieldValidator confirmTransactionPin(String pin) {
    return (value) {
      if (value!.isEmpty) {
        return 'Please enter your pin';
      }
      if (value.length < 4) {
        return 'Pin must be 4 digits';
      }
      if (value != pin) {
        return 'Pin does not match';
      }
      return null;
    };
  }

  static FormFieldValidator phone([String errorText = 'Invalid phone number']) {
    return (value) {
      if (value.toString().replaceAll(' ', '').length != 11) return errorText;
      return null;
    };
  }

  static FormFieldValidator bvn([String errorText = 'Invalid bvn number']) {
    return (value) {
      if (value.toString().replaceAll(' ', '').length != 11) return errorText;
      return null;
    };
  }

  static FormFieldValidator accountNumber(int min) {
    return (value) {
      if (value.toString().length < min) {
        return 'must be at least $min characters';
      }
      return null;
    };
  }

  static FormFieldValidator number({String errorText = 'Invalid'}) {
    return (value) {
      if (!isInt(value)) return errorText;
      return null;
    };
  }

  static FormFieldValidator name({String errorText = 'Invalid name'}) {
    return (value) {
      final regEx = RegExp(r'^[A-Z][a-zA-Z]*(-[A-Z][a-zA-Z]*)?$');
      if (!regEx.hasMatch(value)) return errorText;
      return null;
    };
  }

  static FormFieldValidator withCustomConditions(
      List<StringCondition> conditions) {
    return (value) {
      for (final condition in conditions) {
        if (!condition.check(value)) {
          return condition.message;
        }
      }
      return null;
    };
  }

  static FormFieldValidator userName() {
    return (value) {
      if (value.toString().length < 3) {
        return 'must be at least 3 characters';
      }

      // regEx for username
      final regEx = RegExp(r'^[a-zA-Z0-9_]*$');
      if (!regEx.hasMatch(value)) return 'Invalid username';

      return null;
    };
  }

  static FormFieldValidator postAmount(
      [String errorText =
          'Amount must be greater than NGN 100 and less that NGN 20,000']) {
    return (value) {
      final double? amount =
          double.tryParse(value.toString().replaceAll(',', ''));
      if (amount == null) return errorText;

      if (amount < 100 || amount > 20000.toDouble()) return errorText;

      return null;
    };
  }
}
