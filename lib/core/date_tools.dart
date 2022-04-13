import 'package:intl/intl.dart';

class DateTools {
  static String formatDate(String date) {
    try {
      if (date.isNotEmpty) {
        return DateFormat("yyyy-MM-dd").format(DateTime.parse(date));
      }
    } catch (_) {
      // Log Exception
    }
    return date;
  }
}
