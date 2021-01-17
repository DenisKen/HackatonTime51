import 'package:intl/intl.dart';

class DateNow{

  static getDateNow(){
    DateTime now = DateTime.now();
    return DateFormat('yyyy-MM-dd  kk:mm:ss').format(now);
  }
  static convertDate(date){
    return DateFormat('yyyy-MM-dd  kk:mm:ss').format(date);
  }
}