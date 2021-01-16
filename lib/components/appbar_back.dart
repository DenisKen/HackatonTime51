import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget  with PreferredSizeWidget{

  final String title;
  final Function onPressed; 
  AppBarBack({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green),
          onPressed: onPressed != null ? onPressed : 
            (){Navigator.pop(context);},
        ),
        title: title != null ? Text(title) : null,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}