import 'dart:convert';

import 'package:Discere/components/input_fields.dart';
import 'package:Discere/models/user_notifier.dart';
import 'package:Discere/screens/signup/signup_screen.dart';
import 'package:Discere/services/server_service.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:Discere/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  bool buttonEnable = false;
  bool showInputPass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SafeArea(
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 56.5,
                  backgroundImage: AssetImage(ThemeAsset.logo),
                  backgroundColor: Colors.grey,
                ),
                Padding(padding: EdgeInsets.only(bottom: 60)),
                _inputField(),
                Padding(padding: EdgeInsets.only(bottom: 15)),
                _buttonLogIn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField() {
    return Form(
        key: formKey,
        child: Column(
          children: [
            InputFormField(
              //Active Button when Inputfield Isnt Empty
              onChanged: (value) {
                value.isEmpty
                    ? setState(() {
                        buttonEnable = false;
                      })
                    : setState(() {
                        buttonEnable = true;
                      });
              },
              controller: _emailController,
              width: SizeConfig.safeBlockHorizontal * 100,
              iconData: Icons.email_outlined,
              borderColor: ThemeColor.primary_color,
              validator: (String value) {
                if (!Validator.email(value)) {
                  return "";
                }
                return null;
              },
            ),
            Visibility(
              visible: showInputPass,
              child: InputFormField(
                //Active Button when Inputfield Isnt Empty
                onChanged: (value) {
                  value.isEmpty
                      ? setState(() {
                          buttonEnable = false;
                        })
                      : setState(() {
                          buttonEnable = true;
                        });
                },
                controller: _passController,
                width: SizeConfig.safeBlockHorizontal * 100,
                iconData: Icons.lock_outline,
                borderColor: ThemeColor.primary_color,
                validator: (value) {
                  if (value.isEmpty) {
                    print("name false");
                    return "";
                  }
                  return null;
                },
              ),
            ),
          ],
        ));
  }

  Widget _buttonLogIn() {
    return SizedBox(
      height: 50,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: RaisedButton(
        onPressed: buttonEnable
            ? () async {
                if (this.formKey.currentState.validate()) {
                  if (showInputPass) {
                    await Provider.of<UserNotifier>(context, listen: false)
                        .login("");
                    return;
                  }

                  var data = {'email': _emailController.text};
                  var response =
                      await ServerService.instance.checkEmail(jsonEncode(data));

                  print(response.body);
                  print(response.statusCode);
                  
                  if (jsonDecode(response.body)['hasUser'] != null) {
                    if (jsonDecode(response.body)['hasUser'] == true) {
                      setState(() {
                        showInputPass = true;
                      });
                      return;
                    } else {
                      setState(() {
                        showInputPass = false;
                      });
                    }
                  }
                 

                  if (response.statusCode != 200) return;

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignUpScreen(
                                emailFilled: _emailController.text,
                              )));
                  formKey.currentState.dispose();
                }
              }
            : null,
        color: ThemeColor.primary_color,
        disabledColor: ThemeColor.button_disabled_primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        child: Text(
          'Login',
          style: ThemeText.font_bold_15_white,
        ),
      ),
    );
  }
}
