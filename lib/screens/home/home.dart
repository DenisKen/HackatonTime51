import 'package:Discere/components/appbar_back.dart';
import 'package:Discere/models/discover_lives_notifier.dart';
import 'package:Discere/models/user.dart';
import 'package:Discere/screens/home/discover.dart';
import 'package:Discere/screens/home/mentor_profile.dart';
import 'package:Discere/screens/home/my_classes.dart';
import 'package:Discere/screens/home/search.dart';
import 'package:Discere/screens/home/student_profile.dart';
import 'package:Discere/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  String currentScreen = "";

  List<String> screens = ['discover', 'classes', 'profile'];
  List<bool> iconSelected = [false, false, false];

  @override
  void initState() {
    pageController = new PageController(initialPage: 0);
    iconSelected[0] = true;

    currentScreen = "discover";

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _getInitialInfosFromServer();
    
    super.didChangeDependencies();
  }

  void _getInitialInfosFromServer() async {
    await Provider.of<DiscoverLivesNotifier>(context, listen: false).update();
  }

  void _onPageChange(index) {
    FocusScope.of(context).unfocus();

    List<bool> newIconSelected = [false, false, false];

    iconSelected = newIconSelected;

    setState(() {
      iconSelected[index] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.background,
      body: SafeArea(
        child: PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          onPageChanged: _onPageChange,
          children: [
            Discover(),
            //Search(),
            MyClasses(),
            _profileView(),
          ],
        ),
      ),
      bottomNavigationBar: _appBarBottom(),
    );
  }

  Widget _appBarBottom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      height: 65,
      color: ThemeColor.black_grey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _icon(ThemeAsset.home, 'Ínicio', selected: iconSelected[0]),
          //_icon(ThemeAsset.search, 'Pesquisar', selected: iconSelected[1]),
          _icon(ThemeAsset.book, 'Aulas', selected: iconSelected[1]),
          _icon(ThemeAsset.profile, 'Perfil', selected: iconSelected[2])
        ],
      ),
    );
  }

  Widget _icon(String asset, String text, {bool selected}) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: 7)),
          SizedBox(
            width: 24,
            height: 24,
            child: Image(
              image: AssetImage(asset),
              color: selected ? ThemeColor.primary_color : Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: selected ? ThemeColor.primary_color : Colors.white),
          )
        ],
      ),
    );
  }

  Widget _profileView() {
    if (User.instance.role == "student")
      return StudentProfile();
    else
      return MentorProfile();
  }
}
