import 'dart:convert';

import 'package:Discere/models/user.dart';
import 'package:Discere/services/server_service.dart';
import 'package:Discere/utils/enum_authStatus.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.none;

  Future<void> login(data) async {
    _updateAuthStatus(AuthStatus.authenticating);
    //Try to authenticate with our server
    var response = await ServerService.instance.login(data);
    print(response.statusCode);
    print(response.body.toString());
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      _updateAuthStatus(AuthStatus.authenticated);
      return;
    }
    _updateAuthStatus(AuthStatus.unauthenticated);
    return;
  }

  Future<void> createUser(data) async {
    _updateAuthStatus(AuthStatus.authenticating);
    //Try to createUser with our server
    var response = await ServerService.instance.createUser(data);
    print(response.body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      _initUser(jsonDecode(response.body));

      _updateAuthStatus(AuthStatus.authenticated);
      return;
    }
    _updateAuthStatus(AuthStatus.unauthenticated);
    return;
  }

  Future<void> _initUser(json) async {
    User.fromJson(json);
    _updateAuthStatus(AuthStatus.authenticated);
    
  }

  void _updateAuthStatus(AuthStatus newValue) {
    authStatus = newValue;
    print("updateAuthStatus " + authStatus.toString());
    notifyListeners();
  }
}
