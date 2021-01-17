import 'package:flutter/material.dart';

abstract class ThemeColor {

  static const white = const Color.fromRGBO(255,255,255,1.0);
  static const eclipse = const Color.fromRGBO(55,55,55,1.0);
  static const black = const Color.fromRGBO(0,0,0,1.0);
  static const blue_violet = const Color.fromRGBO(166,77,235,1.0);
  static const medium_state_blue = const Color.fromRGBO(197,142,240,1.0);
  static const silver = const Color.fromRGBO(196,196,196,1.0);
  static const grainsboro = const Color.fromRGBO(231,231,231,1.0);
  static const charcoal = const Color.fromRGBO(69,69,69,1.0);
  static const grey = const Color.fromRGBO(132,132,132,1.0);

  static const flamingo = const Color.fromRGBO(231,91,91,1.0);  

  static const facebook = const Color.fromRGBO(62,104,255,1.0);

  //
  static const text_disabled = const Color.fromRGBO(142,142,142,1.0);
  static const button_disabled = const Color.fromRGBO(245,245,245,1.0);
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
abstract class ThemeText{
   static const TextStyle roboto_medium_14_charcoal = TextStyle(
    fontFamily: 'Roboto',
    color: Colors.red,
    fontSize: 14,
    fontWeight: FontWeight.w500
  );


  static const TextStyle sign_up_title = TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.black,
    fontSize: 18,
    fontWeight: FontWeight.w500
  );
  static const TextStyle sign_up_option = TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.charcoal,
    fontSize: 16,
    fontWeight: FontWeight.w500
  );
  static const TextStyle sign_up_input_field = TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.charcoal,
    fontSize: 14,
    fontWeight: FontWeight.bold
  );
  static const TextStyle sign_up_input_field_hint = TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.grainsboro,
    fontSize: 14,
    fontWeight: FontWeight.bold
  );
  static const TextStyle sign_up_input_field_tip = TextStyle(
    fontFamily: 'Roboto',
    color: ThemeColor.silver,
    fontSize: 12,
    fontWeight: FontWeight.w500
  );
  static const TextStyle sign_up_continue = TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
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

abstract class ThemeAsset{

  //Logos
  static const String logo_87_87_purple_white = "assets/images/logos/logo_87_87_purple_white.png";
  static const String logo60_60_white = "assets/images/logos/logo_60_60_white.png";
  static const String logo99_24 = "assets/images/logos/logo_99_24.png";
  static const String logo127_45 = "assets/images/logos/logo_127_45.png";

  //Images
  static const String giftBox = "assets/images/giftbox.png";
  static const String like = "assets/images/like.png";
  static const String pen = "assets/images/pen.png";
  static const String popupImage1 = "assets/images/popup_image_1.png";
  static const String settings = "assets/images/settings.png";
  
  //Icons
  static const String addPlus = "assets/images/icons/add_plus.png";
  static const String addRounded = "assets/images/icons/add_rounded.png";
  static const String arrow = "assets/images/icons/arrow.png";
  static const String check = "assets/images/icons/check.png";
  static const String clip = "assets/images/icons/clip.png";
  static const String deleteX = "assets/images/icons/delete_x.png";
  static const String game = "assets/images/icons/game.png";
  static const String lock = "assets/images/icons/lock.png";
  static const String man = "assets/images/icons/man.png";
  static const String removeRounded = "assets/images/icons/remove_rounded.png";
  static const String unlike = "assets/images/icons/unlike.png";
  static const String video = "assets/images/icons/video.png";
  static const String warningAmber = "assets/images/icons/warning_amber.png";
  static const String woman = "assets/images/icons/woman.png";
  static const String matchThunder = "assets/images/icons/match_thunder.png";

  //Chat
  static const String chatPic = "assets/images/chat/chat_pic.png";

  //SocialMedia
  static const String facebook = "assets/images/socialmedia/facebook.png";
  static const String instagram = "assets/images/socialmedia/instagram.png";
  static const String telegram = "assets/images/socialmedia/telegram.png";
  static const String twitter = "assets/images/socialmedia/twitter.png";
  static const String whatsapp = "assets/images/socialmedia/whatsapp.png";
}