import 'package:Discere/manager_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_notifier.dart';

void main() {
  //Do initial things neeeded here
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserNotifier>(
          create: (_) => UserNotifier(),
        )
      ],
      child: MaterialApp(
        title: 'Discere',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ManagerRoute(),
      ),
    );
  }
}