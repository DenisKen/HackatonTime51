import 'package:http/http.dart' as http;

class ServerService {
  static final ServerService _instance = new ServerService._internal();
  ServerService._internal();
  static ServerService get instance => _instance;

  factory ServerService() {
    return _instance;
  }

  Future<http.Response> checkEmail(data) async{
    //Check-Email
    print("Authenticating with server: auth(email) >>>>>>>>>>>>>>>>>>>>>>");
    return http.post('https://discere-api.herokuapp.com/login/check',
    headers: <String, String>{
          'Content-Type': 'application/json'}, 
       body: data);
  }
  Future<http.Response> createUser(data) async{
    //Create-User
    print("Authenticating with server: createUser(data) >>>>>>>>>>>>>>>>>>>>>>");
    return http.post('https://discere-api.herokuapp.com/users',
       headers: <String, String>{
          'Content-Type': 'application/json'},       
       body: data);
  }
  Future<http.Response> login(data) async{
    //Create-User
    print("Authenticating with server: login(data) >>>>>>>>>>>>>>>>>>>>>>");
    return http.post('https://discere-api.herokuapp.com/login',
       headers: <String, String>{
          'Content-Type': 'application/json'},       
       body: data);
  }

  Future<http.Response> getLives() async{
    //GetLives
    print("Server: getLives(data) >>>>>>>>>>>>>>>>>>>>>>");
    return http.get('https://discere-api.herokuapp.com/lives');
  }
}
