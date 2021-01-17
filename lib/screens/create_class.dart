import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/components/input_fields.dart';
import 'package:Discere/components/picker_hour.dart';
import 'package:Discere/components/profile_button.dart';
import 'package:Discere/theme/style.dart';
import 'package:Discere/utils/date_now.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  final _calendarController = CalendarController();
  TextEditingController _initialHourController = TextEditingController();
  TextEditingController _endHourController = TextEditingController();

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
            child: Column(
              children: [
                _category(),
                _title(),
                _description(),
                _calendar(),
                _button()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _category() {
    return Column(
      children: [
        Text('Categoria'),
        InputFormField(
          width: SizeConfig.safeBlockHorizontal * 100,
          controller: _titleController,
          hintText: 'Categoria',
        )
      ],
    );
  }

  Widget _title() {
    return Column(
      children: [
        Text('Título da aula'),
        InputFormField(
          width: SizeConfig.safeBlockHorizontal * 100,
          controller: _titleController,
          hintText: 'Título',
        ),
      ],
    );
  }

  Widget _description() {
    return Column(children: [
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
      )),
    ]);
  }

  Widget _calendar() {
    return Column(children: [
      TableCalendar(
        locale: 'pt_BR',
        onDaySelected: (date, list, list2) {
          print(DateNow.convertDate(date));
        },
        availableGestures: AvailableGestures.none,
        availableCalendarFormats: {CalendarFormat.month: '2 weeks'},
        calendarController: _calendarController,
      ),
      _calendarTimeStartEnd()
    ]);
  }

  Widget _calendarTimeStartEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ínicio'),
            PickerHour(
              controller: _initialHourController,
              callBack: (value) {
                print(value);
              },
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Termino'),
            PickerHour(
              controller: _endHourController,
              callBack: (value) {
                print(value);
              },
            )
          ],
        )
      ],
    );
  }

  Widget _button() {
    return ProfileButton(
      title: 'Salvar',
      width: SizeConfig.safeBlockHorizontal * 100,
      onPressed: () {},
    );
  }
}
