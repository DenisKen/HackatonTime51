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
    return Container(
      
    );
  }
}