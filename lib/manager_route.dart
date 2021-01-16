import 'package:Discere/screens/loading.dart';
import 'package:Discere/screens/login.dart';
import 'package:Discere/utils/enum_authStatus.dart';
import 'package:Discere/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user_notifier.dart';

class ManagerRoute extends StatefulWidget {
  @override
  _ManagerRouteState createState() => _ManagerRouteState();
}

class _ManagerRouteState extends State<ManagerRoute> {
  @override
  void didChangeDependencies() {
    _checkLocalAuth();

    super.didChangeDependencies();
  }

  Future<void> _checkLocalAuth() async {
    await Provider.of<UserNotifier>(context, listen: false).auth();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<UserNotifier>(builder: (context, notifier, _) {
      switch (notifier.authStatus) {
        case AuthStatus.authenticated:
          return Login();
          break;
        case AuthStatus.unauthenticated:
          return Login();
          break;
        default:
          return LoadingScreen();
      }
    });
  }
}
