import 'package:Discere/components/class_panel.dart';
import 'package:Discere/components/profile_button.dart';
import 'package:Discere/components/profile_view/profile_view_basic_info.dart';
import 'package:Discere/components/profile_view/profile_view_trophies.dart';
import 'package:Discere/screens/create_class.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/size_config.dart';

import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Column(children: <Widget>[
              ProfileViewBasicInfo(name: "Alan Sousa",age: "24",location: "--",role: "Mentor",color: ThemeColor.secondary_color,),
              Padding(padding: EdgeInsets.only(bottom: 30)),
              ProfileViewTrophies(),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              _bio(),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              _nextClass(),
              Padding(padding: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileButton(
                    title: 'Editar perfil',
                    color: ThemeColor.secondary_color,
                    width: SizeConfig.safeBlockHorizontal * 42.5,
                    onPressed: () {},
                  ),
                  ProfileButton(
                    title: 'Criar aula',
                    color: ThemeColor.secondary_color,
                    width: SizeConfig.safeBlockHorizontal * 42.5,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateClass()));
                    },
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _nextClass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Próxima aula', style: ThemeText.font_bold_24_white,),
        Padding(padding: EdgeInsets.only(bottom:10),),
        ClassPanel(title: 'Aula 1', date: '01 / 16', hour: '19:00')
      ],
    );
  }

  Widget _bio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio',style: ThemeText.font_bold_24_white,),
        Padding(padding: EdgeInsets.only(bottom:10),),
        Text('asdok aposdk aspod kasdpo kaspodk paosdokasdkpkasopdk', style: ThemeText.font_normal_15_white,)
      ],
    );
  }
}
