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
            Text("Data de nascimento", style: ThemeText.sign_up_option),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _field(
                    tip: "Dia",
                    width: 60.0,
                    maxLength: 2,
                    controller: _dayController),
                _field(
                    tip: "Mês",
                    width: 60.0,
                    maxLength: 2,
                    controller: _monthController),
                _field(
                    tip: "Ano",
                    width: 83.0,
                    maxLength: 4,
                    controller: _yearController),
              ],
            )
          ]),
    );
  }

  Widget _field({tip, width, maxLength, controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$tip", style: ThemeText.input_field_tip),
        Padding(padding: EdgeInsets.only(bottom: 13)),
        InputFormField(
          onChanged: (value) {
            _validate();
          },
          borderColor: ThemeColor.secondary_color,
          controller: controller,
          width: width,
          maxLength: maxLength,
          textInputType: TextInputType.number,
          validator: (String value) {
            if (value.isEmpty) {
              print("value empty");
              return "";
            }
            return null;
          },
        ),
      ],
    );
  }
}
