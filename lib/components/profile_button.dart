import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ProfileButton extends StatelessWidget {
  final width;
  final onPressed;
  final title;

  const ProfileButton({Key key, @required this.width, @required this.onPressed, @required this.title}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      child: RaisedButton(
          elevation: 0,
          onPressed: onPressed,
          child: Text('$title'),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0))),
    );
  }
}
