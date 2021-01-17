import 'package:flutter/material.dart';

class InputFieldSearch extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  final double width;

  const InputFieldSearch({Key key, this.controller, this.onChanged, this.width})
      : super(key: key);

  @override
  _InputFieldSearchState createState() => _InputFieldSearchState();
}

class _InputFieldSearchState extends State<InputFieldSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
          width: widget.width,
          height: 50,
          child: Material(
            elevation: 1,
            child: TextField(
                controller: widget.controller,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    hintStyle: null,
                    border: new OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white)),
          )),
    );
  }
}
