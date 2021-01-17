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
  final _categoryController = TextEditingController();
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
      backgroundColor: ThemeColor.background,
      appBar: AppBarBack(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
            child: Column(
              children: [
                _category(),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                ),
                _title(),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                ),
                _description(),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                ),
                _calendar(),
                Padding(
                  padding: EdgeInsets.only(bottom: 24),
                ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categoria',
          style: ThemeText.input_field_tip,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 12),
        ),
        InputFormField(
          width: SizeConfig.safeBlockHorizontal * 100,
          borderColor: ThemeColor.secondary_color,
          controller: _categoryController,
          hintText: 'Categoria',
        )
      ],
    );
  }

  Widget _title() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Título da aula',
          style: ThemeText.input_field_tip,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 12),
        ),
        InputFormField(
          width: SizeConfig.safeBlockHorizontal * 100,
          borderColor: ThemeColor.secondary_color,
          controller: _titleController,
        ),
      ],
    );
  }

  Widget _description() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Descrição',
        style: ThemeText.input_field_tip,
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 12),
      ),
      Container(
          child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: TextStyle(fontSize: 14),
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        decoration: new InputDecoration(
          border: new UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.secondary_color),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.secondary_color),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ThemeColor.secondary_color),
          ),
        ),
      )),
    ]);
  }

  Widget _calendar() {
    return Column(children: [
      TableCalendar(
        calendarStyle: CalendarStyle(
          holidayStyle: ThemeText.font_regular_11_white,
          weekdayStyle: ThemeText.font_regular_11_white ,
          weekendStyle: ThemeText.font_regular_11_white ,
          selectedColor:ThemeColor.secondary_color,
          todayColor: null,
          markersColor: Colors.brown[700],
          outsideDaysVisible: false,
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: ThemeText.font_bold_11_white,
          weekendStyle: ThemeText.font_bold_11_white,
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: ThemeText.font_bold_15_white,
        ),
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
            Text('Ínicio',style: ThemeText.input_field_tip,),
            Padding(padding: EdgeInsets.only(bottom:10),),
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
            Text('Termino',style: ThemeText.input_field_tip,),
            Padding(padding: EdgeInsets.only(bottom:10),),
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
      color: ThemeColor.secondary_color,
      width: SizeConfig.safeBlockHorizontal * 100,
      onPressed: () {},
    );
  }
}
