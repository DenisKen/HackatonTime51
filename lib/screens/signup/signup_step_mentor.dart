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
      Text("Você é...", style: ThemeText.sign_up_title),
      Padding(padding: EdgeInsets.only(bottom:13)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        
        SizedBox(
          width: 118,
          height: 100,
          child: RaisedButton(  
            onPressed: (){
              _choiceUserGenre("student");
            },
            color: ThemeColor.white,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              side: _userType == "student" ? 
                    BorderSide(color: ThemeColor.blue_violet) : 
                    BorderSide.none,
              borderRadius: new BorderRadius.circular(6.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(ThemeAsset.woman,
                  color: _userType == "student" ? 
                    ThemeColor.blue_violet : 
                    ThemeColor.charcoal,
                ),
                Padding(padding: EdgeInsets.only(bottom: 11)),
                Text("Aluno")
              ]
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(right:26)),
        SizedBox(
          width: 118,
          height: 100,
          child: RaisedButton(  
            onPressed: (){
              _choiceUserGenre("mentor");
            },
            color: ThemeColor.white,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              side: _userType == "mentor" ? 
                    BorderSide(color: ThemeColor.blue_violet) : 
                    BorderSide.none,
              borderRadius: new BorderRadius.circular(6.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(ThemeAsset.man,
                  color: _userType == "mentor" ? 
                    ThemeColor.blue_violet : 
                    ThemeColor.charcoal
                ),
                Padding(padding: EdgeInsets.only(bottom: 11)),
                Text("Mentor")
              ]
            ),
          ),
        ),
      ])
    ]);
  }
}