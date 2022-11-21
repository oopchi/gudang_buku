import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class FormatHelper {
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
}
