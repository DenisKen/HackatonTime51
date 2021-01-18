import 'package:Discere/components/class_panel.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class MyClasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.safeBlockVertical * 100,
      width: SizeConfig.safeBlockHorizontal * 100,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
          child: Text(
            'Minhas Aulas',
            style: ThemeText.sign_up_option,
          ),
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
        itemCount: 0,
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
