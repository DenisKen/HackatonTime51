import 'package:flutter/material.dart';

abstract class ThemeColor {
  static const background = const Color.fromRGBO(55, 55, 55, 1.0);

  static const primary_color = const Color.fromRGBO(114, 102, 248, 1.0);
  static const secondary_color = const Color.fromRGBO(252, 209, 42, 1.0);

  static const black_grey = const Color.fromRGBO(39, 39, 39, 1.0);
  static const light_green = const Color.fromRGBO(93, 255, 0, 1.0);

  static const tip = const Color.fromRGBO(143, 146, 161, 1.0);

  static const button_disabled_primary =
      const Color.fromRGBO(114, 102, 248, 1.0);
  static const button_disabled_secondary =
      const Color.fromRGBO(252, 209, 42, 1.0);

  static const white = const Color.fromRGBO(255, 255, 255, 1.0);
  static const eclipse = const Color.fromRGBO(55, 55, 55, 1.0);
  static const black = const Color.fromRGBO(0, 0, 0, 1.0);
  static const blue_violet = const Color.fromRGBO(166, 77, 235, 1.0);
  static const medium_state_blue = const Color.fromRGBO(197, 142, 240, 1.0);
  static const silver = const Color.fromRGBO(196, 196, 196, 1.0);
  static const grainsboro = const Color.fromRGBO(231, 231, 231, 1.0);
  static const charcoal = const Color.fromRGBO(69, 69, 69, 1.0);
  static const grey = const Color.fromRGBO(132, 132, 132, 1.0);

  static const flamingo = const Color.fromRGBO(231, 91, 91, 1.0);

  static const facebook = const Color.fromRGBO(62, 104, 255, 1.0);

  //
  static const text_disabled = const Color.fromRGBO(142, 142, 142, 1.0);
  static const button_disabled = const Color.fromRGBO(245, 245, 245, 1.0);
  //

  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GRADIENT COLORS
  static const LinearGradient gradient_blue_violet = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(166, 77, 235, 1.0),
        Color.fromRGBO(166, 77, 235, 0.5)
      ]);
}

abstract class ThemeText {
  static const TextStyle font_bold_6_white = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 6,
      fontWeight: FontWeight.bold);
  static const TextStyle font_regular_11_white = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.w300);
       static const TextStyle font_bold_11_white = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 11,
      fontWeight: FontWeight.bold);
  static const TextStyle font_medium_12_white = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.w500);
  static const TextStyle font_bold_12_white = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold);

static const TextStyle font_bold_12_secondary_color = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.secondary_color,
      fontSize: 12,
      fontWeight: FontWeight.bold);
static const TextStyle font_bold_15_secondary_color = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.secondary_color,
      fontSize: 15,
      fontWeight: FontWeight.bold);
  static const TextStyle font_normal_15_white = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.white,
      fontSize: 15,
      fontWeight: FontWeight.normal);
  static const TextStyle font_bold_15_white = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.white,
      fontSize: 15,
      fontWeight: FontWeight.bold);
  static const TextStyle font_bold_24_secondary_color = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.secondary_color,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static const TextStyle font_bold_24_white = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.white,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static const TextStyle sign_up_option = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold);
  static const TextStyle sign_up_input_field = TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold);
  static const TextStyle sign_up_input_field_hint = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.grainsboro,
      fontSize: 14,
      fontWeight: FontWeight.bold);

  static const TextStyle input_field_tip = TextStyle(
      fontFamily: 'Roboto',
      color: ThemeColor.tip,
      fontSize: 12,
      fontWeight: FontWeight.w500);
  static const TextStyle sign_up_continue = TextStyle(
      fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold);
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

abstract class ThemeAsset {
  //Logos

  //Images

  //Icons
  static const String man = "assets/images/icons/man.png";
  static const String woman = "assets/images/icons/woman.png";

  static const String trophy = "assets/images/icons/trophy.png";

  static const String home = "assets/images/icons/home.png";
  static const String search = "assets/images/icons/search.png";
  static const String book = "assets/images/icons/book.png";
  static const String profile = "assets/images/icons/profile.png";

  //SocialMedia
}
