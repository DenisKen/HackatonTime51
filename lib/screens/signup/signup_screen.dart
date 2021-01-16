import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/components/continue_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  PageController _pageController;

  final int _screenLength = 6;
  double _currentPage = 0;

  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPass = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();
  final _formKeyBirthday = GlobalKey<FormState>();
  final _formKeyCPF = GlobalKey<FormState>();
  final _formKeyLocation = GlobalKey<FormState>();

  final List<String> screensSteps = ["email", "password","name","birthday", "genre", "pics"];
  String currentScreen;

  bool _active = false;
  void activeButton(value){
    setState(() {
      _active = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: 0);
    currentScreen = screensSteps[0];

    setState(() {
      _currentPage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarBack(),
      body: Stack(
        children: <Widget> [

        ],
      ),
    );
  }

  Widget widgetContinueButton(){
    return ContinueButton(onPressed: 
       _active ? (){ 
              void nextPage(){
                FocusScope.of(context).unfocus();
                _pageController.nextPage(
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.linear
                );
                setState(() {
                  _currentPage = _pageController.page + 1;
                });
              }
              //["email", "password","name","birthday", "genre", "pics"];
              switch (currentScreen) {
                case "email":            
                  if(this._formKeyEmail.currentState.validate()){
                    _formKeyEmail.currentState.dispose();
                    nextPage();    
                  }
                  break;
                case "password":   
                  if(this._formKeyPass.currentState.validate()){
                    _formKeyPass.currentState.dispose();
                    nextPage();    
                  }               
                  break;
                case "name": 
                  if(this._formKeyName.currentState.validate()){
                    _formKeyName.currentState.dispose();
                    nextPage();    
                  }                   
                  break;
                case "birthday":   
                  if(this._formKeyBirthday.currentState.validate()){
                    _formKeyBirthday.currentState.dispose();
                    nextPage();    
                  }                
                  break;
                case "genre": 
                  nextPage();                 
                  break;
                case "pics":   
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (BuildContext context) => Container()),
                     ModalRoute.withName('/home'),
                  );  
                  break;
                default:
                  return;
              }
            } : null
    );
  }
}