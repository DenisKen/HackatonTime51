import 'package:Discere/components/input_fields.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:Discere/utils/validator.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<bool> activeButton;
  final String currentScreenStep;

  const Login(
      {Key key, this.formKey, this.activeButton, this.currentScreenStep})
      : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: ThemeColor.gradient_blue_violet),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                _inputField(),
                Padding(padding: EdgeInsets.only(bottom: 15)),
                _buttonLogIn(),
                Padding(padding: EdgeInsets.only(bottom: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[_buttonFacebook(), _buttonGoogle()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField() {
    return InputFormField(
      //Active Button when Inputfield Isnt Empty
      onChanged: (value) {
        value.isEmpty
            ? setState(() {
                widget.activeButton(false);
              })
            : setState(() {
                widget.activeButton(true);
              });
      },
      controller: _controller,
      width: SizeConfig.safeBlockHorizontal * 100,
      hintText: "E-mail",
      validator: (String value) {
        if (!Validator.email(value)) {
          return "";
        }
        return null;
      },
    );
  }

  Widget _buttonLogIn() {
    return SizedBox(
      height: 50,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: RaisedButton(
        onPressed: () async {},
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.green)),
        child: Text('LOG IN'),
      ),
    );
  }

  Widget _buttonFacebook() {
    return SizedBox(
      height: 50,
      width: SizeConfig.safeBlockHorizontal * 42.5,
      child: RaisedButton(
        onPressed: () async {},
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.green)),
        child: Text('LOG IN'),
      ),
    );
  }

  Widget _buttonGoogle() {
    return SizedBox(
      height: 50,
      width: SizeConfig.safeBlockHorizontal * 42.5,
      child: RaisedButton(
        onPressed: () async {},
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: BorderSide(color: Colors.green)),
        child: Text('LOG IN'),
      ),
    );
  }
}
