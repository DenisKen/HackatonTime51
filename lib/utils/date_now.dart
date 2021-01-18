import 'package:intl/intl.dart';

class DateNow {
  static getDateNow() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
  }

  static convertDate(date) {
    return DateFormat('yyyy-MM-dd  kk:mm:ss').format(date);
  }

  static String getDDMMFromDate(date) {
    var dateTime = DateTime.parse(date);
    return DateFormat('dd-MM').format(dateTime);
  }

  static String getHHMMFromDate(date) {
    var dateTime = DateTime.parse(date);
    return DateFormat('kk:mm').format(dateTime);
  }
}
