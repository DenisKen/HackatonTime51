import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/theme/style.dart';
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
      backgroundColor: ThemeColor.background,
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
                  //_subscribes()
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
        color: ThemeColor.background,
        height: 200,
        child: Column(
          children: [
            Expanded(child: Center(child: Text('$title',style: ThemeText.font_bold_24_secondary_color,))),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('$date',style: ThemeText.font_bold_15_secondary_color,), Text('$hour',style: ThemeText.font_bold_15_secondary_color,)],
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
              backgroundColor: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            Text('Nome',style: ThemeText.font_bold_15_white,),
          ],
        ),
        Container(
          width: 78,
          height: 72,
          decoration: BoxDecoration(
              color: ThemeColor.secondary_color,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text('20',style: ThemeText.font_bold_24_white,),
            Text('Vagas',style: ThemeText.font_bold_15_white,),
          ],) ),
        )
      ],
    );
  }

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Descrição',style: ThemeText.font_bold_24_white,),
        Padding(padding: EdgeInsets.only(bottom: 10)),
        Text('Lorem asidja sdjioa jiojdoi ajdoiasj oiajdojao jaodj aodjaid', style: ThemeText.font_normal_15_white,)
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
        color: ThemeColor.primary_color,
        child: Center(child: Text('Registrar', style: ThemeText.font_bold_15_white,)),
      ),
    );
  }
}
