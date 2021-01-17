import 'package:Discere/models/user.dart';
import 'package:Discere/utils/enum_authStatus.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.none;

  Future<AuthStatus> auth(email, pass) async {
    _updateAuthStatus(AuthStatus.authenticating);
    //Try to authenticate with our server
    if (email != "teste" && pass != "teste"){
        authStatus = AuthStatus.unauthenticated;
        return authStatus;
    }
    //
    await _initUser(null, 'token1231');

    return authStatus;
  }

  Future<void> _initUser(json, token) async {
    //User.fromJson(json);
    _updateAuthStatus(AuthStatus.authenticated);
  }

  void _updateAuthStatus(AuthStatus newValue) {
    authStatus = newValue;
    print("updateAuthStatus " + authStatus.toString());
    notifyListeners();
  }
}
