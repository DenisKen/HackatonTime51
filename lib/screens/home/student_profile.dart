import 'package:Discere/components/profile_button.dart';
import 'package:Discere/components/profile_view/profile_view_basic_info.dart';
import 'package:Discere/components/profile_view/profile_view_trophies.dart';
import 'package:Discere/components/vocational_bar.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Column(children: <Widget>[
              ProfileViewBasicInfo(name: "Denis Ken",age: "23",location: "--",role: "Aluno",),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              ProfileViewTrophies(),
              _vocationColumn(),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              ProfileButton(
                title: 'Editar perfil',
                width: SizeConfig.safeBlockHorizontal * 100,
                onPressed: () {},
              ),
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
        Text('Status', style: ThemeText.font_bold_24_white,),
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
                    progressColor: Colors.greenAccent),
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
  
}
