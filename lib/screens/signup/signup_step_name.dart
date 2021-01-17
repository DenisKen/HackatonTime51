import 'package:Discere/components/input_fields.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class SignUpStepName extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueChanged<Map<String, dynamic>> activeButton;
  final String currentScreenStep;

  const SignUpStepName(
      {Key key, this.formKey, this.activeButton, this.currentScreenStep})
      : super(key: key);

  @override
  _SignUpStepNameState createState() => _SignUpStepNameState();
}

class _SignUpStepNameState extends State<SignUpStepName> {
  final _nameController = TextEditingController();
  final _nicknameController = TextEditingController();

  void _validator() {
    _nameController.text.isEmpty
        ? setState(() {
            widget.activeButton({
              'active': false,
            });
          })
        : setState(() {
            widget.activeButton({
              'active': true,
              'name': _nameController.text,
              'socialName': _nicknameController.text
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: widget.formKey,
        child: Column(children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 40)),
          Text("Qual seu nome completo?", style: ThemeText.sign_up_title),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          InputFormField(
            width: SizeConfig.safeBlockHorizontal*100,
            hintText: "Nome completo",
            controller: _nameController,
            onChanged: (value) {
              _validator();
            },
            validator: (value) {
              if (value.isEmpty) {
                print("name false");
                return "";
              }
              return null;
            },
          ),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          Text("Qual seu nome social?", style: ThemeText.sign_up_title),
          Padding(padding: EdgeInsets.only(bottom: 13)),
          InputFormField(
              width: 274,
              hintText: "Nome social",
              controller: _nicknameController,
              onChanged: (value) {
                _validator();
              })
        ]),
      ),
    );
  }
}
