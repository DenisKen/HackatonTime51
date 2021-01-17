import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Function onPressed;
  final Color color;
  AppBarBack({Key key, this.title, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColor.background,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: color != null ? color : ThemeColor.primary_color),
        onPressed: onPressed != null
            ? onPressed
            : () {
                Navigator.pop(context);
              },
      ),
      title: title != null ? Text(title) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
