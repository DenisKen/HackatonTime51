import 'package:http/http.dart' as http;

class ServerService {
  static final ServerService _instance = new ServerService._internal();
  ServerService._internal();
  static ServerService get instance => _instance;

  factory ServerService() {
    return _instance;
  }

  Future<void> checkEmail(email) async{
    //Check-Email
  }

  Future<void> auth(email,pass) async{
    //Login
  }
}
