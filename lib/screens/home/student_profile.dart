import 'package:flutter/material.dart';

class StudentProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(children: <Widget>[
            _rowAvatar(),
            Padding(padding: EdgeInsets.only(bottom: 30)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Troféus"),
              Container(
                height: 100,
                color: Colors.black,
                              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index){
                    return  CircleAvatar(radius: 40);
                  },
                  separatorBuilder: (BuildContext context, int index) => const Padding(padding: EdgeInsets.only(right: 10),),
                ),
              )
            ],)
          ]),
        ),
      ),
    );
  }

  Widget _rowAvatar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _avatar(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome'),
            Text('Idadsdasdase'),
            Text('Localização'),
            Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Text('Aluno'))
          ],
        )
      ],
    );
  }

  Widget _avatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: 110,
            height: 110,
            decoration: new BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            )),
        Positioned.fill(
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
          bottom: -20,
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
