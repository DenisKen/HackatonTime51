import 'package:Discere/manager_route.dart';
import 'package:Discere/models/discover_lives_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'models/user_notifier.dart';

void main() {
  //Do initial things neeeded here
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(
          create: (_) => UserNotifier(),
        ),
        ChangeNotifierProvider<DiscoverLivesNotifier>(
          create: (_) => DiscoverLivesNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'Discere',
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white) ,
          primarySwatch: Colors.purple,
        ),
        home: ManagerRoute(),
      ),
    );
  }
}