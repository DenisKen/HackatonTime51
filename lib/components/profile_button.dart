import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProfileButton extends StatelessWidget {
  final width;
  final onPressed;
  final title;

  final Color color;

  const ProfileButton(
      {Key key,
      @required this.width,
      @required this.onPressed,
      @required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      
      child: RaisedButton(
          elevation: 0,
          onPressed: onPressed,
          child: Text('$title', style: ThemeText.font_bold_15_white,),
          color: color != null ? color : ThemeColor.primary_color,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0))),
    );
  }
}
