import 'package:Discere/components/input_fields.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignUpStepGenre extends StatefulWidget {
  final ValueChanged<Map<String, dynamic>> activeButton;
  final String currentScreenStep;

  const SignUpStepGenre({Key key, this.activeButton, this.currentScreenStep})
      : super(key: key);

  @override
  _SignUpStepGenreState createState() => _SignUpStepGenreState();
}

class _SignUpStepGenreState extends State<SignUpStepGenre> {
  var _otherGenreController = TextEditingController();

  String _userGenre = "";

  bool _switchGenreMen = true;
  bool _switchGenreWomen = true;

  void _choiceUserGenre(String value) {
    setState(() {
      _userGenre = value;
    });
    _validateContinueButton();
  }

  void _validateContinueButton() {
    if (_userGenre != "" &&
        (_switchGenreMen == true || _switchGenreWomen == true))
      widget.activeButton({'active': true, 'gender':_userGenre});
    else
      widget.activeButton({'active': false});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 40)),
          Text("Você é...", style: ThemeText.sign_up_title),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            SizedBox(
              width: 118,
              height: 100,
              child: RaisedButton(
                onPressed: () {
                  _choiceUserGenre("woman");
                },
                color: ThemeColor.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    side: _userGenre == "woman"
                        ? BorderSide(color: ThemeColor.blue_violet)
                        : BorderSide.none,
                    borderRadius: new BorderRadius.circular(6.0)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        ThemeAsset.woman,
                        color: _userGenre == "woman"
                            ? ThemeColor.blue_violet
                            : ThemeColor.charcoal,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 11)),
                      Text("Uma mulher")
                    ]),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 26)),
            SizedBox(
              width: 118,
              height: 100,
              child: RaisedButton(
                onPressed: () {
                  _choiceUserGenre("man");
                },
                color: ThemeColor.white,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    side: _userGenre == "man"
                        ? BorderSide(color: ThemeColor.blue_violet)
                        : BorderSide.none,
                    borderRadius: new BorderRadius.circular(6.0)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(ThemeAsset.man,
                          color: _userGenre == "man"
                              ? ThemeColor.blue_violet
                              : ThemeColor.charcoal),
                      Padding(padding: EdgeInsets.only(bottom: 11)),
                      Text("Um homem")
                    ]),
              ),
            ),
          ]),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          Text("Outro", style: ThemeText.sign_up_title),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          _inputOtherGenre()
        ]);
  }

  Widget _inputOtherGenre() {
    return InputFormField(
      onChanged: (value) {},
      width: SizeConfig.safeBlockHorizontal * 100,
      controller: _otherGenreController
    );
  }
}
