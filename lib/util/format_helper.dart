import 'dart:math' as math;

import 'package:bookstore/util/form_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class FormatHelper {
  static const Map<String, String> currencyUnits = <String, String>{
    'rb': 'ribu',
    'jt': 'juta',
    'M': 'miliar',
    'T': 'triliun'
  };

  static const Map<int, String> currencyAbbrPerThreeDigits = <int, String>{
    0: '',
    1: 'K',
    2: 'M',
    3: 'B',
    4: 'T',
    5: 'Q',
    6: 'QN',
    7: 'S',
    8: 'SP',
    9: 'O',
    10: 'N',
    11: 'D',
    12: 'U',
    13: 'DD',
    14: 'TD',
    15: 'QD',
    16: 'QND',
    17: 'SD',
    18: 'SPD',
    19: 'OD',
    20: 'ND',
  };

  static final NumberFormat currency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  static String formatNumAbbr(int num) {
    final NumberFormat numberFormat = NumberFormat.compact();

    return numberFormat.format(num);
  }

  static String formatDateTime(DateTime dateTime, String pattern) {
    final DateFormat dateFormat = DateFormat(
      pattern,
      dotenv.env['LOCALE'],
    );

    return dateFormat.format(dateTime);
  }

  static String formatDateTimeFromString(
    String dateTimeString,
    String pattern,
  ) {
    if (dateTimeString == '-' || dateTimeString == '') return dateTimeString;

    final DateTime? dateTime = DateTime.tryParse(dateTimeString)?.toLocal();

    if (dateTime == null) return dateTimeString;

    return formatDateTime(dateTime, pattern);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    if (!phoneNumber.startsWith(dotenv.env['COUNTRY_CODE']!.substring(1))) {
      phoneNumber = dotenv.env['COUNTRY_CODE']!.substring(1) + phoneNumber;
    }

    return phoneNumber;
  }

  static String formatPhoneNumberWithoutCountryCode(String phoneNumber) {
    if (phoneNumber.startsWith('0')) {
      phoneNumber = phoneNumber.substring(1);
    }

    if (phoneNumber.startsWith(dotenv.env['COUNTRY_CODE']!.substring(1))) {
      phoneNumber = phoneNumber.substring(2);
    }

    return phoneNumber;
  }

  static String formatTitleCase(String value) {
    if (value.isNotEmpty) {
      return value[0].toUpperCase() + value.substring(1).toLowerCase();
    }

    return '';
  }

  static String formatHHMMSS(int seconds) {
    final int hours = (seconds / 3600).truncate();
    seconds = seconds % 3600;
    final int minutes = (seconds / 60).truncate();

    final String hoursStr = (hours).toString().padLeft(2, '0');
    final String minutesStr = (minutes).toString().padLeft(2, '0');
    final String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  static String printTimer(int seconds) {
    final Duration remaining = Duration(seconds: seconds);

    String twoDigits(int n) {
      if (n >= 10) {
        return '$n';
      }

      return '0$n';
    }

    final String twoDigitMinutes = twoDigits(remaining.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(remaining.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  static String formatDateyMMMd(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat.yMMMd(
      dotenv.env['LOCALE'],
    );

    return dateFormat.format(dateTime);
  }

  static String formatCurrency(String text) {
    final NumberFormat f = NumberFormat(' #,###', 'id_ID');
    final double num = double.parse(text.replaceAll(f.symbols.GROUP_SEP, ''));
    final String newString = f.format(num);
    return 'Rp$newString';
  }

  static String formatShortCurrency(double amount) {
    final double tempAmount = amount.abs();
    if (tempAmount == 0) return tempAmount.toInt().toString();

    int numOfThreeDigits = 0;
    int temp = tempAmount.toInt();

    while (temp > 0) {
      temp ~/= 1000;
      if (temp > 0) numOfThreeDigits++;
    }

    final String prefix = currencyAbbrPerThreeDigits[numOfThreeDigits]!;
    return '${amount < 0 ? '-' : ''}${tempAmount ~/ (math.pow(1000, numOfThreeDigits))} $prefix';
  }

  static String formatDoubleWithPreciseDecimal(double value) {
    return FormValidator.isWhole(value)
        ? value.toStringAsFixed(0)
        : value.toString();
  }

  static String formatISOTime(DateTime date) {
    final Duration duration = date.timeZoneOffset;
    if (duration.isNegative) {
      return '${date.toIso8601String()}-'
          '${duration.inHours.toString().padLeft(2, '0')}:'
          '${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}';
    } else {
      return '${date.toIso8601String()}+'
          '${duration.inHours.toString().padLeft(2, '0')}:'
          '${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}';
    }
  }
}

class InputFormatter {
  static TextEditingValue formatPhoneNumber(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isNotEmpty && newValue.text[0] == '0') {
      return TextEditingValue(
        text: newValue.text.substring(1),
        selection: TextSelection.collapsed(
          offset: newValue.selection.end - 1,
        ),
      );
    }

    return newValue;
  }

  static TextEditingValue formatNumeric(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;
      final NumberFormat f = NumberFormat('#,###', 'id_ID');
      final int num =
          int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final String newString = f.format(num);
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndexFromTheRight,
        ),
      );
    } else {
      return newValue;
    }
  }

  static TextInputFormatter maximumNumber(int maxNumber) {
    return TextInputFormatter.withFunction((_, TextEditingValue newValue) {
      if (int.parse(newValue.text) > maxNumber) {
        return TextEditingValue(
          text: maxNumber.toString(),
        );
      }

      return newValue;
    });
  }

  static TextInputFormatter formatDecimalFractionLength(int fractionLength) {
    return TextInputFormatter.withFunction((
      TextEditingValue oldValue,
      TextEditingValue newValue,
    ) {
      TextSelection newSelection = newValue.selection;
      String truncated = newValue.text;

      final String value = newValue.text;

      if (value.contains(',') &&
          value.substring(value.indexOf(',') + 1).length > fractionLength) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ',') {
        truncated = '0,';
        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    });
  }

  static TextInputFormatter formatPersonFullName() {
    return FilteringTextInputFormatter.allow(
      RegExp(
        '[a-z A-Z .,]',
      ), //Regex allow only alphabet, white space and '.' and ','
    );
  }

  static TextInputFormatter formatAlpanumeric() {
    return FilteringTextInputFormatter.allow(
      RegExp(
        '[a-zA-Z0-9]',
      ), //Regex allow only alphanumeric character
    );
  }
}
