import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class InputFormField extends StatefulWidget {
  final double width;

  final String initialValue;
  final String hintText;
  final int maxLength;

  final IconData iconData;
  final Color borderColor;

  final GlobalKey<FormState> formKey;
  final Function validator;

  final TextEditingController controller;
  final String errorValidator;

  final TextInputType textInputType;

  final Function(String) onChanged;

  const InputFormField(
      {Key key,
      @required this.width,
      @required this.controller,
      this.hintText,
      this.validator,
      this.errorValidator,
      this.formKey,
      this.textInputType,
      this.maxLength,
      this.onChanged,
      this.initialValue,
      this.borderColor,
      this.iconData})
      : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();
}

class _InputFormFieldState extends State<InputFormField> {
  @override
  void initState() {
    super.initState();

    if (this.widget.controller != null && this.widget.onChanged != null)
      this.widget.controller.addListener(() {
        return this.widget.controller.text;
      });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    if (this.widget.controller != null) this.widget.controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.widget.width,
      height: 44,
      child: TextFormField(
        
        onChanged: this.widget.onChanged,
        maxLength: this.widget.maxLength,
        textAlign: TextAlign.left,
        keyboardType: this.widget.textInputType,
        controller: this.widget.controller,
        validator: this.widget.validator,
        style: ThemeText.sign_up_input_field,
        decoration: InputDecoration(
          prefixIconConstraints: BoxConstraints(minWidth: 20, maxHeight: 44),
          prefixIcon: widget.iconData != null
              ? Container(
                  child: Padding(
                      padding: EdgeInsets.only(
                          right: 20, bottom: 5), // add padding to adjust icon
                      child: Icon(widget.iconData, color: Colors.white)),
                )
              : null,
          contentPadding: new EdgeInsets.only(bottom: 17),
          counter: SizedBox.shrink(),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          errorStyle: TextStyle(height: 0),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor != null
                    ? widget.borderColor
                    : ThemeColor.primary_color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: widget.borderColor != null
                    ? widget.borderColor
                    : ThemeColor.primary_color),
          ),
        ),
      ),
    );
  }
}
