import 'package:Discere/screens/class_detail.dart';
import 'package:flutter/material.dart';

class ClassPanel extends StatelessWidget {
  final String title;
  final String date;
  final String hour;

  final bool live;

  const ClassPanel({Key key, this.date, this.title, this.hour, this.live})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Class_Panel Tapped");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClassDetail(
                      title: title,
                      date: date,
                      hour: hour,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 200,
        color: Colors.amber[600],
        child: Column(children: [
          live != null
              ? live
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: FittedBox(
                              fit: BoxFit.contain, child: Text('live'))),
                    )
                  : Container()
              : Container(),
          Expanded(child: Center(child: Text('$title'))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('$date'), Text('$hour')],
            ),
          )
        ]),
      ),
    );
  }
}
