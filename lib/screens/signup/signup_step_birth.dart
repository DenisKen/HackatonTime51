import 'package:Discere/components/input_fields.dart';
import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class SignUpStepBirth extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<Map<String, dynamic>> activeButton;
  final String currentScreenStep;

  const SignUpStepBirth(
      {Key key, this.formKey, this.activeButton, this.currentScreenStep})
      : super(key: key);

  @override
  _SignUpStepBirthState createState() => _SignUpStepBirthState();
}

class _SignUpStepBirthState extends State<SignUpStepBirth> {
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();

  void _validate() {
    if (_dayController.text.length >= 2 &&
        _monthController.text.length >= 2 &&
        _yearController.text.length >= 4) {
      var tempBirthday = _dayController.text +
          "/" +
          _monthController.text +
          "/" +
          _yearController.text;
      widget.activeButton({'active': true, 'birthday': tempBirthday});
    } else {
      widget.activeButton({'active': false});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Text("Qual sua data de nascimento?",
                style: ThemeText.sign_up_title),
            Padding(padding: EdgeInsets.only(bottom: 13)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InputFormField(
                  onChanged: (value) {
                    _validate();
                  },
                  controller: _dayController,
                  width: 60,
                  maxLength: 2,
                  hintText: "Dia",
                  textInputType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      print("day empty");
                      return "";
                    }
                    return null;
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 13.5)),
                InputFormField(
                  onChanged: (value) {
                    _validate();
                  },
                  controller: _monthController,
                  width: 60,
                  maxLength: 2,
                  hintText: "Mês",
                  textInputType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      print("month empty");
                      return "";
                    }
                    return null;
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 13.5)),
                InputFormField(
                  onChanged: (value) {
                    _validate();
                  },
                  controller: _yearController,
                  width: 83,
                  maxLength: 4,
                  hintText: "Ano",
                  textInputType: TextInputType.number,
                  validator: (String value) {
                    if (value.isEmpty) {
                      print("year empty");
                      return "";
                    }
                    return null;
                  },
                ),
              ],
            )
          ]),
    );
  }
}
