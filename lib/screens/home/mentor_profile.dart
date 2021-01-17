import 'package:Discere/components/class_panel.dart';
import 'package:Discere/components/profile_button.dart';
import 'package:Discere/utils/size_config.dart';

import 'package:flutter/material.dart';

class MentorProfile extends StatelessWidget {
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
                    width: SizeConfig.safeBlockHorizontal * 42.5,
                    onPressed: () {},
                  ),
                  ProfileButton(
                    title: 'Criar aula',
                    width: SizeConfig.safeBlockHorizontal * 42.5,
                    onPressed: () {},
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
        Text('Próxima aula'),
        ClassPanel(title: 'Aula 1', date: 'dia / mes', hour: 'Horário')
      ],
    );
  }

  Widget _bio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bio'),
        Text('asdok aposdk aspod kasdpo kaspodk paosdokasdkpkasopdk')
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
