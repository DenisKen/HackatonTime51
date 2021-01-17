import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/models/user.dart';
import 'package:Discere/screens/home/discover.dart';
import 'package:Discere/screens/home/my_classes.dart';
import 'package:Discere/screens/home/search.dart';
import 'package:Discere/screens/home/student_profile.dart';
import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  String currentScreen = "";

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: 1);
    currentScreen = "discover";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _appBarBottom(),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: [
              Discover(),
              Search(),
              MyClasses(),
              _profileView(),

            ],
          ),
        ));
  }

  Widget _appBarBottom(){
     return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      height: 50,
      color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _icon(ThemeAsset.addPlus, 'Ínicio'),
          _icon(ThemeAsset.addPlus, 'Pesquisar'),
          _icon(ThemeAsset.addPlus, 'Aulas'),
          _icon(ThemeAsset.addPlus, 'Perfil')
        ],
      ),
    );
  }
  Widget _icon(String asset, String text) {
    return Container(
      child: Column(
        children: [Image(image: AssetImage(asset)), Text(text)],
      ),
    );
  }

  Widget _profileView() {
    if (User.instance.role == "Student")
      return StudentProfile();
    else
      return StudentProfile();
  }
}
