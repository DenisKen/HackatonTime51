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
      widget.activeButton({'active': true, 'gender': _userGenre});
    else
      widget.activeButton({'active': false});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22,vertical: 21),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 40)),
              Text("Seu gênero", style: ThemeText.sign_up_option),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Padding(padding: EdgeInsets.only(right: 26)),
                _choiceGenre(genre: "woman", labelText: "Mulher", asset: ThemeAsset.woman),
                Padding(padding: EdgeInsets.only(right: 23)),
                 _choiceGenre(genre: "man", labelText: "Homem", asset: ThemeAsset.man),
                
              ]),
              Padding(padding: EdgeInsets.only(bottom: 13)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Outro", style: ThemeText.input_field_tip),
              Padding(padding: EdgeInsets.only(bottom: 13)),
              _inputOtherGenre()
              ],)
              
            ]),
      ),
    );
  }

  Widget _choiceGenre({genre, labelText, asset}) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: RaisedButton(
            onPressed: () {
              _choiceUserGenre(genre);
            },
            color: ThemeColor.black_grey,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                side: _userGenre == genre
                    ? BorderSide(color: ThemeColor.secondary_color)
                    : BorderSide.none,
                borderRadius: new BorderRadius.circular(120)),
            child: Image.asset(
              asset,
              color: _userGenre == genre ? ThemeColor.secondary_color : Colors.white,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 11)),
        Container(
            width: 88,
            height: 24,
            decoration: BoxDecoration(
                border: _userGenre == genre
                    ? Border.all(color: ThemeColor.secondary_color)
                    : null,
                color: ThemeColor.black_grey,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Center(
                child: Text(
              labelText,
              style: ThemeText.font_bold_12_white,
            )))
      ],
    );
  }

  Widget _inputOtherGenre() {
    return InputFormField(

        borderColor: ThemeColor.secondary_color,
        onChanged: (value) {},
        width: SizeConfig.safeBlockHorizontal * 100,
        controller: _otherGenreController);
  }
}
