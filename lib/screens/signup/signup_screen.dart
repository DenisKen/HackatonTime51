import 'dart:convert';

import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/components/continue_button.dart';
import 'package:Discere/models/signup_data.dart';
import 'package:Discere/models/user_notifier.dart';
import 'package:Discere/screens/home/home.dart';
import 'package:Discere/screens/signup/signup_step_birth.dart';
import 'package:Discere/screens/signup/signup_step_email.dart';
import 'package:Discere/screens/signup/signup_step_genre.dart';
import 'package:Discere/screens/signup/signup_step_mentor.dart';
import 'package:Discere/screens/signup/signup_step_name.dart';
import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  final String emailFilled;

  const SignUpScreen({Key key, this.emailFilled}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  PageController _pageController;
  final int _screenLength = 6;
  double _currentPage = 0;
  Color color;
  Color colorDisabled;

  SignUpData data = new SignUpData();

  final _formKeyEmailPass = GlobalKey<FormState>();
  final _formKeyName = GlobalKey<FormState>();
  final _formKeyBirthday = GlobalKey<FormState>();

  final List<String> screensSteps = [
    "emailPass",
    "name",
    "birthday",
    "genre",
    "typeUser"
  ];
  String currentScreen;

  bool _active = false;

  void activeButton(Map<String, dynamic> value) {
    setState(() {
      _active = value['active'];
      //data = data.fromJson(value);
      if (value['email'] != null) data.email = value['email'];
      if (value['pass'] != null) data.pass = value['pass'];
      if (value['name'] != null) data.name = value['name'];
      if (value['socialName'] != null) data.socialName = value['socialName'];
      if (value['birthday'] != null) data.birthday = value['birthday'];
      if (value['genrer'] != null) data.genre = value['genrer'];
      if (value['userType'] != null) data.userType = value['userType'];
    });
  }

  @override
  void initState() {
    _pageController = new PageController(initialPage: 0);
    currentScreen = screensSteps[0];

    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _currentPage = 0;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: ThemeColor.background,
      appBar: AppBarBack(),
      body: Stack(
        children: <Widget>[widgetSignUpSteps(), widgetContinueButton()],
      ),
    );
  }

  Widget widgetSignUpSteps() {
    return Positioned(
      child: Align(
        alignment: Alignment.center,
        child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              _active = false;
              currentScreen = screensSteps[value];
            });
          },
          children: <Widget>[
            SignUpStepEmail(
                emailFilled: widget.emailFilled,
                formKey: _formKeyEmailPass,
                activeButton: activeButton,
                currentScreenStep: currentScreen),
            SignUpStepName(
                formKey: _formKeyName,
                activeButton: activeButton,
                currentScreenStep: currentScreen),
            SignUpStepBirth(
                formKey: _formKeyBirthday,
                activeButton: activeButton,
                currentScreenStep: currentScreen),
            SignUpStepGenre(
              activeButton: activeButton,
              currentScreenStep: currentScreen,
            ),
            SignUpStepTypeUser(
              activeButton: activeButton,
              currentScreenStep: currentScreen,
            )
          ],
        ),
      ),
    );
  }

  Widget widgetContinueButton() {
    return ContinueButton(
        color: color,
        colorDisabled: colorDisabled,
        onPressed: _active
            ? () async {
                void nextPage() {
                  FocusScope.of(context).unfocus();
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);

                  setState(() {
                    _currentPage = _pageController.page + 1;
                  });
                }

                //["email", "password","name","birthday", "genre", "pics"];
                switch (currentScreen) {
                  case "emailPass":
                    if (this._formKeyEmailPass.currentState.validate()) {
                      _formKeyEmailPass.currentState.dispose();
                      nextPage();
                      setState(() {
                        color = ThemeColor.secondary_color;
                        colorDisabled = ThemeColor.button_disabled_secondary;
                      });
                    }
                    break;
                  case "name":
                    if (this._formKeyName.currentState.validate()) {
                      _formKeyName.currentState.dispose();
                      nextPage();
                      setState(() {
                        color = ThemeColor.secondary_color;
                        colorDisabled = ThemeColor.button_disabled_secondary;
                      });
                    }
                    break;
                  case "birthday":
                    if (this._formKeyBirthday.currentState.validate()) {
                      _formKeyBirthday.currentState.dispose();
                      nextPage();
                      setState(() {
                        color = ThemeColor.secondary_color;
                        colorDisabled = ThemeColor.button_disabled_secondary;
                      });
                    }
                    break;
                  case "genre":
                    nextPage();
                    setState(() {
                      color = ThemeColor.primary_color;
                      colorDisabled = ThemeColor.button_disabled_primary;
                    });
                    break;
                  case "typeUser":
                    var json = {
                      'name': data.name,
                      'email': data.email,
                      'password': data.pass,
                      'role': data.userType
                    };
                    print(jsonEncode(json));

                    Navigator.pop(context);

                    await Provider.of<UserNotifier>(context, listen: false)
                        .createUser(jsonEncode(json));

                    
                    /*
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => Container()),
                      ModalRoute.withName('/home'),
                    );
                    */
                    break;
                  default:
                    return;
                }
              }
            : null);
  }
}
