import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class ClassDetail extends StatelessWidget {
  final String title;
  final String date;
  final String hour;

  const ClassDetail({Key key, this.title, this.date, this.hour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Stack(children: [
        SingleChildScrollView(
          child: Container(
              child: Column(children: [
            _panelCover(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
              child: Column(
                children: [
                  _rowMentor(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  _details(),
                  Padding(padding: EdgeInsets.only(bottom: 20)),
                  _subscribes()
                ],
              ),
            )
          ])),
        ),
        _button()
      ]),
    );
  }

  Widget _panelCover() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: Colors.grey,
        height: 200,
        child: Column(
          children: [
            Expanded(child: Center(child: Text('$title'))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('$date'), Text('$hour')],
              ),
            )
          ],
        ));
  }

  Widget _rowMentor() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 40,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            Text('Professor'),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(child: Text('20')),
        )
      ],
    );
  }

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Detalhes'),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Text('Lorem asidja sdjioa jiojdoi ajdoiasj oiajdojao jaodj aodjaid')
      ],
    );
  }

  Widget _subscribes() {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
        ),
        Container(
          height: 20,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(child: Text('11')),
        )
      ],
    );
  }

  Widget _button() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: SizeConfig.safeBlockHorizontal * 100,
        color: Colors.grey,
        child: Center(child: Text('Register')),
      ),
    );
  }
}
