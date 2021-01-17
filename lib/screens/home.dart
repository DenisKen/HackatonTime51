import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/components/appbar_bottom.dart';
import 'package:Discere/models/user.dart';
import 'package:Discere/screens/discover.dart';
import 'package:Discere/screens/my_classes.dart';
import 'package:Discere/screens/search.dart';
import 'package:Discere/screens/student_profile.dart';
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
      height: 50,
      color: Colors.red,
      child: Row(
        children: [
          _icon(ThemeAsset.addPlus, 'Ínicio')
        ],
      ),
    );
  }
  Widget _icon(String asset, String text) {
    return Column(
      children: [Image(image: AssetImage(asset)), Text(text)],
    );
  }

  Widget _profileView() {
    if (User.instance.role == "Student")
      return StudentProfile();
    else
      return StudentProfile();
  }
}
