import 'package:Discere/components/vocational_bar.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Column(children: <Widget>[
              _rowAvatar(),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              _rowTrophies(),
              _vocationColumn()
            ]),
          ),
        ),
      ),
    );
  }

  Widget _vocationColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Status'),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                VocationalBar(
                  title: 'Adaptação',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.8,
                  progressColor: Colors.purple,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Autodesenvolvimento',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.9,
                  progressColor: Colors.red,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Resiliência',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.3,
                  progressColor: Colors.blueAccent,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Introversão',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.8,
                  progressColor: Colors.orange,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Criatividade',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.5,
                  progressColor: Colors.green,
                ),
              ],
            ),
            Column(
              children: [
                VocationalBar(
                  title: 'Agilidade',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.6,
                  progressColor: Colors.purpleAccent,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Resolver problemas',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.5,
                  progressColor: Colors.greenAccent
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Extroversão',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.3,
                  progressColor: Colors.redAccent,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Responsabilidade',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.1,
                  progressColor: Colors.orangeAccent,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                VocationalBar(
                  title: 'Bondade',
                  width: SizeConfig.safeBlockHorizontal * 40,
                  percent: 0.2,
                  progressColor: Colors.cyan,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _rowAvatar() {
    return Container(
      height: 150,
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _avatarImage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome'),
              Text('Idade'),
              Text('Localização'),
              Container(
                width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(child: Text('Aluno')))
            ],
          )
        ],
      ),
    );
  }

  Widget _rowTrophies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Troféus"),
        Container(
          height: 100,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return CircleAvatar(radius: 40);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
          ),
        )
      ],
    );
  }

  Widget _avatarImage() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
                  child: Container(
              width: 110,
              height: 110,
              decoration: new BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              )), 
        ),
        Positioned.fill(
          top: 0,
          child: Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              radius: 50,
              child: Text('AH'),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: new BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: Align(alignment: Alignment.center, child: Text('1')),
          ),
        )
      ],
    );
  }
}
