import 'package:Discere/screens/class_detail.dart';
import 'package:Discere/screens/live.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ClassPanel extends StatelessWidget {
  final String title;
  final String date;
  final String hour;
  final bool live;

  final String cover;
  final String mentorId;
  final String description;
  final String channelName;
  final String channelToken;

  final String id;

  const ClassPanel(
      {Key key,
      this.date,
      this.title,
      this.hour,
      this.live,
      this.cover,
      this.mentorId,
      this.id,
      this.description,
      this.channelName, this.channelToken})
      : super(key: key);
      
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Live(
                  channelToken: channelToken,
                      channelName: channelName,
                    )));
        return;
        print("Class_Panel Tapped");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClassDetail(
                      title: title,
                      cover: cover,
                      channelName: channelName,
                      channelToken: channelToken,
                      date: date,
                      hour: hour,
                      description: description,
                    )));
      },
      child: Container(
        height: 195,
        width: SizeConfig.safeBlockHorizontal * 100,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage('$cover'), fit: BoxFit.fill),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
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
                                fit: BoxFit.contain,
                                child: Text(
                                  'live',
                                  style: ThemeText.font_bold_6_white,
                                ))),
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
      ),
    );
  }
}
