import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class ContinueButton extends StatelessWidget {
  final Function onPressed;

  final Color color;
  final Color colorDisabled;

  const ContinueButton(
      {Key key, this.onPressed, this.color, this.colorDisabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: SizedBox(
          height: 50,
          width: SizeConfig.safeBlockHorizontal * 80,
          child: RaisedButton(
              elevation: 1,
              disabledTextColor: Colors.grey,
              disabledColor: colorDisabled != null
                  ? colorDisabled
                  : ThemeColor.button_disabled_primary,
              onPressed: onPressed,
              color: color != null ? color : ThemeColor.primary_color,
              child: Text('Continue', style: ThemeText.font_bold_15_white),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(50.0))),
        ),
      ),
    );
  }
}
