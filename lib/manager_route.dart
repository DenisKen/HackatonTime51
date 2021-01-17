import 'package:Discere/screens/home/home.dart';
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
  bool init = false;

  @override
  void didChangeDependencies() {
    if (init) return;
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLocalAuth());

    init = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<UserNotifier>(builder: (context, notifier, _) {
      switch (notifier.authStatus) {
        case AuthStatus.authenticated:
          return Home();
        case AuthStatus.unauthenticated:
          return Home();
        default:
          return LoadingScreen();
      }
    });
  }

  Future<void> _checkLocalAuth() async {
    print("Checking Local Auth >>>>>>>>>>>>>>>>>>>>>> MANAGER_ROUTE");

    await Provider.of<UserNotifier>(context, listen: false).auth("","");
  }
}
