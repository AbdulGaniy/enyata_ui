abstract class StringCondition {
  /// a function that takes in the password and returns an a bool;
  /// if the error message is empty, then the password is correct;
  bool check(String text);

  String get message;
}

class UpperCaseCheck implements StringCondition {
  @override
  bool check(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  @override
  String get message => 'An Uppercase letter (A)';
}

class LowerCaseCheck implements StringCondition {
  @override
  bool check(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

  @override
  String get message => 'A Lowercase letter (a)';
}

class NumberCheck implements StringCondition {
  @override
  bool check(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

  @override
  String get message => 'A Number (1)';
}

class SpecialCharacterCheck implements StringCondition {
  @override
  bool check(String password) {
    return password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  }

  @override
  String get message => 'A Special Character (!)';
}

class LengthCheck implements StringCondition {
  @override
  bool check(String password) {
    return password.length >= 8;
  }

  @override
  String get message => '8 characters minimum';
}
