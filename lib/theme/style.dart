import 'package:flutter/material.dart';

abstract class ThemeColor {

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GRADIENT COLORS
  static const LinearGradient gradient_blue_violet = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(166, 77, 235, 1.0),
        Color.fromRGBO(166, 77, 235, 0.5)
  ]);

}
abstract class ThemeText{
   static const TextStyle roboto_medium_14_charcoal = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.red,
    fontSize: 14,
    fontWeight: FontWeight.w500
  );
  static const TextStyle sign_up_input_field_hint = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.grey,
    fontSize: 14,
    fontWeight: FontWeight.bold
  );
  static const TextStyle sign_up_input_field = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.bold
  );
}

abstract class ThemeEffect {
  static List<BoxShadow> shadowInputField() {
    List<BoxShadow> v = [
      new BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 10,
        offset: Offset(0, 3),
      )
    ];
    return v;
  }
}
