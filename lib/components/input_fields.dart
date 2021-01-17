import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class InputFormField extends StatefulWidget {

  final double width;

  final String initialValue;
  final String hintText;
  final int maxLength;

  final GlobalKey<FormState> formKey;
  final Function validator;

  final TextEditingController controller;
  final String errorValidator;

  final TextInputType textInputType;

  final Function(String) onChanged;

  const InputFormField({Key key, this.width, this.controller, this.hintText, this.validator, this.errorValidator, this.formKey, this.textInputType, this.maxLength, this.onChanged, this.initialValue}) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {

  @override
  void initState() {
    super.initState();

    if (this.widget.controller != null && this.widget.onChanged != null)
      this.widget.controller.addListener((){return this.widget.controller.text;});
  }

   @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    if (this.widget.controller != null)
      this.widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: ThemeEffect.shadowInputField()
      ),
      child: TextFormField(
        onChanged: this.widget.onChanged,
        maxLength: this.widget.maxLength,
        textAlign: TextAlign.center,
        keyboardType: this.widget.textInputType,
        controller: this.widget.controller,
        validator: this.widget.validator,   
        style: ThemeText.sign_up_input_field,
        decoration: InputDecoration(
          counter: SizedBox.shrink(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1
            ),
          ),
          errorStyle: TextStyle(height: 0),
          hintText: this.widget.hintText,
          hintStyle:  ThemeText.sign_up_input_field_hint,
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white
        ),
      ),
    );
  }
}
