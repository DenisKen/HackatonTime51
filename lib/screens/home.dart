import 'package:Discere/components/class_panel.dart';
import 'package:Discere/screens/live.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> mainDataList = [
    'League of Legends',
    'Valorant',
    'Call of Duty',
    'Call of Duty Mobile',
    'Mobile Games',
    'Hearthstone'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            height: SizeConfig.safeBlockVertical * 100,
            width: SizeConfig.safeBlockHorizontal * 100,
            child: Column(children: [
              Text(
                'Aulas disponivel',
                style: TextStyle(color: Colors.white),
              ),
              Container(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return ClassPanel(
                        title: 'COMO VIREI CRIADOR DE JOGOS DIGITAIS',
                        date: '16/01',
                        hour: '19:00');
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ),
              )
            ]),
          ),
        ));
  }
}
