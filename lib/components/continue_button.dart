import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {

  final Function onPressed;

  const ContinueButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom:40),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: SizedBox(
          height: 50,
          width: 274,
          child: RaisedButton(
            elevation: 1,
            disabledTextColor: Colors.grey,
            disabledColor: Colors.grey,
            onPressed: onPressed,
            color: Colors.white,
            child: Text('Continue'),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(50.0))
          ),
        ),
      ),
    );
  }
}