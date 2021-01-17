import 'package:Discere/screens/class_detail.dart';
import 'package:Discere/theme/style.dart';
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
        decoration: BoxDecoration(
                              color: ThemeColor.black_grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13))),
        
        child: Column(
          children: [
          live != null
              ? live
                  ? Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                              color: ThemeColor.light_green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: FittedBox(
                              fit: BoxFit.contain, child: Text('live', style: ThemeText.font_bold_6_white,))),
                    )
                  : Container()
              : Container(),
          Expanded(
              child: Center(
                  child: Text(
            '$title',
            style: ThemeText.font_bold_24_secondary_color,
          ))),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$date',
                  style: ThemeText.font_bold_12_secondary_color,
                ),
                Text(
                  '$hour',
                  style: ThemeText.font_bold_12_secondary_color,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
