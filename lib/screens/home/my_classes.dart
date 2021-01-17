import 'package:Discere/components/class_panel.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 100,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Minhas Aulas',
          style: TextStyle(color: Colors.white),
        ),
        _myClasses()
      ]),
    );
  }

  Widget _myClasses() {
    return Container(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return ClassPanel(
            title: 'COMO VIREI CRIADOR DE JOGOS DIGITAIS',
            date: '16/01',
            hour: '19:00',
            live: true,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
