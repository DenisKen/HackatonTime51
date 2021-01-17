import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class SignUpStepTypeUser extends StatefulWidget {

  final ValueChanged<Map<String, dynamic>> activeButton; 
  final String currentScreenStep;

  const SignUpStepTypeUser({Key key, this.activeButton, this.currentScreenStep}) : super(key: key);

  @override
  _SignUpStepTypeUserState createState() => _SignUpStepTypeUserState();
}

class _SignUpStepTypeUserState extends State<SignUpStepTypeUser> {

   String _userType = "";

  bool _switchMentor = true;
  bool _switchStudent = true;

  void _choiceUserGenre(String value){
    setState(() {
      _userType = value;
    });
    _validatorContinueButton();

  }

  void _validatorContinueButton(){

    if (_userType != "" && (_switchMentor == true || _switchStudent == true))
      widget.activeButton({'active':true,'userType':_userType});
    else
      widget.activeButton({'active':false});
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Padding(padding: EdgeInsets.only(top:40)),
      Text("Você é?", style: ThemeText.sign_up_option),
      Padding(padding: EdgeInsets.only(bottom:30)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        
        _choiceMentor(asset: ThemeAsset.woman, genre: 'student', labelText: 'Aluno'),
        Padding(padding: EdgeInsets.only(right:26)),
        _choiceMentor(asset: ThemeAsset.woman, genre: 'mentor', labelText: 'Mentor'),
      
      ])
    ]);
  }

  Widget _choiceMentor({genre, labelText, asset}) {
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
                side: _userType == genre
                    ? BorderSide(color: ThemeColor.primary_color)
                    : BorderSide.none,
                borderRadius: new BorderRadius.circular(120)),
            child: Image.asset(
              asset,
              color: _userType == genre ? ThemeColor.primary_color : Colors.white,
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 11)),
        Container(
            width: 88,
            height: 24,
            decoration: BoxDecoration(
                border: _userType == genre
                    ? Border.all(color: ThemeColor.primary_color)
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

}