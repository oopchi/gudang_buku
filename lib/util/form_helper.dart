import 'package:email_validator/email_validator.dart';

class FormValidator {
  static bool validatePhone(String value) {
    final RegExp regex = RegExp(r'^[0-9]{7,13}$');
    return regex.hasMatch(value);
  }

  static bool validateEmail(String value) {
    return EmailValidator.validate(value);
  }

  static bool isNumeric(String value) {
    final RegExp regex = RegExp(r'^[\d]+$');
    return regex.hasMatch(value);
  }

  static bool isWhole(num value) {
    return value is int || value == value.truncateToDouble();
  }
}
