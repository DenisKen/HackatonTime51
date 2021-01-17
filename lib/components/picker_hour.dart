import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class PickerHour extends StatelessWidget {
  final controller;
  final ValueChanged<String> callBack;

  const PickerHour({Key key, this.controller, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.safeBlockHorizontal * 30,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: ThemeEffect.shadowInputField()),
      child: TextFormField(
        controller: controller,
        onTap: () async {
          TimeOfDay time = TimeOfDay.now();
          FocusScope.of(context).requestFocus(new FocusNode());

          TimeOfDay picked = await showTimePicker(
            context: context,
            initialTime: time,
          );
          if (picked != null && picked != time) {
            controller.text = picked.format(context);
            print(picked.format(context));
            callBack(picked.format(context));
          }
        },
        decoration: InputDecoration(
            counter: SizedBox.shrink(),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            errorStyle: TextStyle(height: 0),
            hintText: "09:00",
            hintStyle: ThemeText.sign_up_input_field_hint,
            border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: ThemeColor.black_grey),
        validator: (value) {
          if (value.isEmpty) {
            return 'cant be empty';
          }
          return null;
        },
      ),
    );
  }
}
