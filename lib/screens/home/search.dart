import 'package:Discere/components/class_panel.dart';
import 'package:Discere/components/input_fields.dart';
import 'package:Discere/components/inputfield_search.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 21),
      height: SizeConfig.safeBlockVertical * 100,
        width: SizeConfig.safeBlockHorizontal * 100,
      child: Container(
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pesquisar'),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            _searchField(),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Text('Resultado da pesquisa'),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            _listSearch()
          ],
        ),
      ),
      color: Colors.purple,
    );
  }

  Widget _searchField() {
    return Row(
      children: [
        InputFieldSearch(
          width: (SizeConfig.safeBlockHorizontal * 100) - 44,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _listSearch() {
    return Expanded(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 4,
          
          itemBuilder: (BuildContext context, index) {
            return ClassPanel(
              title: 'asd',
              date: '03/21',
              hour: '03:00',
              live: false,
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider()),
    );
  }
}
