import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class ClassDetail extends StatelessWidget {
  final String title;
  final String date;
  final String hour;

  const ClassDetail({Key key, this.title, this.date, this.hour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Container(child: Column(children: [
        panelCover(),
        CircleAvatar(
          radius: 40,
        )
      ])),
    );
  }

  Widget panelCover() {
    return Container(
        color: Colors.grey,
        height: 200,
        child: Column(
          children: [
            Expanded(child: Center(child: Text('$title'))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('$date'), Text('$hour')],
              ),
            )
          ],
        ));
  }
}
