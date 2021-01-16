import 'package:Discere/models/user.dart';
import 'package:Discere/utils/enum_authStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.none;

  final _prefs = SharedPreferences.getInstance();

  Future<AuthStatus> auth() async {
    _updateAuthStatus(AuthStatus.authenticating);

    //Try to authenticate with our server

    //
    await _initUser(null, null);

    return authStatus;
  }

  Future<void> _initUser(json, token) async {
    User.fromJson(json);

    //Save Session Locally //////////////////////
    SharedPreferences sharedPrefs = await _prefs;
    sharedPrefs.setString("token", token);

    _updateAuthStatus(AuthStatus.authenticated);
  }

  void _updateAuthStatus(AuthStatus newValue) {
    authStatus = newValue;
    notifyListeners();
  }
}
