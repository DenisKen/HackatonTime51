import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VocationalBar extends StatelessWidget {
  final String title;

  final double width;
  final double percent;
  final double height;

  final Color progressColor;

  const VocationalBar({Key key, this.title, this.width, this.percent, this.height, this.progressColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title'),
        LinearPercentIndicator(
          width: width,
          animation: true,
          lineHeight: height != null ? height : 20,
          animationDuration: 2000,
          percent: percent,
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: progressColor,
        )
      ],
    ));
  }
}
