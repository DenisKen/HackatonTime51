import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/components/input_fields.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: Column(children: [
        Text('Categoria'),
        InputFormField(width: SizeConfig.safeBlockHorizontal*100, controller: _titleController, hintText: 'Categoria',),
        Text('Título da aula'),
        InputFormField(width: SizeConfig.safeBlockHorizontal*100, controller: _titleController, hintText: 'Título',),
        Text('Descrição'),
        Container(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: 'Write something awesome of you!',
              hintStyle: TextStyle(fontSize: 14),
            ),
          )
        )
      ],),
    );
  }
}