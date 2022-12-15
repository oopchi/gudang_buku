import 'package:gudangBuku/util/format_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

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

  static FilteringTextInputFormatter denyAllCharacter() {
    const String matchAllCharacter = '.';
    return FilteringTextInputFormatter.deny(
      RegExp(
        matchAllCharacter,
        dotAll: true,
      ),
    );
  }

  static TextInputFormatter formatCurrency() {
    return TextInputFormatter.withFunction(
      (
        TextEditingValue oldValue,
        TextEditingValue newValue,
      ) {
        return newValue.text != ''
            ? TextEditingValue(
                text: FormatHelper.formatCurrency(
                  newValue.text,
                  prefix: '',
                ),
              )
            : newValue;
      },
    );
  }
}
