class User {
  static final User _instance = User._internal();

  String id;
  String token;

  String name;
  String gender;
  String role;

  String email;


  factory User({id, token, name}) {
    _instance.id = id;
    _instance.token = token;
    _instance.name = name;

    return _instance;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    if (json['user']['user']['gender'] != null)
    _instance.gender = json['user']['user']['gender'];
    if (json['user']['user']['role'] != null)
    _instance.role = json['user']['user']['role'];
    if (json['user']['user']['name'] != null)
    _instance.name = json['user']['user']['name'];
    if (json['user']['user']['email'] != null)
    _instance.email = json['user']['user']['email'];
    if (json['user']['user']['id'] != null)
    _instance.id = json['user']['user']['id'];
    if (json['user']['token'] != null)
    _instance.token = json['user']['token'];

    return _instance;
  }

  static User get instance => _instance;
  User._internal();
}
