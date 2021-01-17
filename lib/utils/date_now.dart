import 'package:intl/intl.dart';

class DateNow{

  static getString(){
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
  }
}