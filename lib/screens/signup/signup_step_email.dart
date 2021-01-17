import 'package:Discere/components/input_fields.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:Discere/utils/validator.dart';
import 'package:flutter/material.dart';

class SignUpStepEmail extends StatefulWidget {
  final String emailFilled;
  final GlobalKey<FormState> formKey;
  final ValueChanged<Map<String, dynamic>> activeButton;
  final String currentScreenStep;

  SignUpStepEmail(
      {Key key,
      this.activeButton,
      this.formKey,
      this.currentScreenStep,
      this.emailFilled})
      : super(key: key);

  @override
  _SignUpStepEmailState createState() => _SignUpStepEmailState();
}

class _SignUpStepEmailState extends State<SignUpStepEmail> {
  var _emailController = TextEditingController();

  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();


  @override
  void didChangeDependencies() {
    setState(() {
      _emailController = new TextEditingController(text: widget.emailFilled);
    });
    
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(padding: EdgeInsets.only(top: 40)),
      Text("Insira seu e-mail",
          style: TextStyle(color: Colors.black, fontSize: 40)),
      Padding(padding: EdgeInsets.only(top: 13)),
      //INPUT FIELD
      Form(
          key: widget.formKey,
          child: Column(
            children: <Widget>[
              _inputEmail(),
              _inputPassword(),
              _inputConfirmPassword()
            ],
          ))
    ]);
  }

  void _validator() {
    _emailController.text.isEmpty ||
            _confirmPassController.text.isEmpty ||
            _passController.text.isEmpty
        ? setState(() {
            widget.activeButton({'active': false});
          })
        : setState(() {
            widget.activeButton({
              'active': true,
              'email': _emailController.text,
              'pass': _passController.text
            });
          });
  }

  Widget _inputEmail() {
    return InputFormField(
      //Active Button when Inputfield Isnt Empty
      onChanged: (value) {
        _validator();
      },
      controller: _emailController,
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

  Widget _inputPassword() {
    return InputFormField(
      onChanged: (value) {
        _validator();
      },
      width: SizeConfig.safeBlockVertical * 100,
      hintText: "Senha",
      controller: _passController,
      validator: (String value) {
        if (value.isEmpty) {
          print("pass false");
          return "";
        }
        return null;
      },
    );
  }

  Widget _inputConfirmPassword() {
    return InputFormField(
      onChanged: (value) {
        _validator();
      },
      width: SizeConfig.safeBlockHorizontal * 100,
      controller: _confirmPassController,
      hintText: "Confirme sua senha",
      validator: (String value) {
        if (value.isEmpty || value != _passController.text) {
          print("confim pass false");
          return "";
        }
        return null;
      },
    );
  }
}
