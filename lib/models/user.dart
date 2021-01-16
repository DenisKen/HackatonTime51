class User {
  static final User _instance = User._internal();

  String id;
  String token;

  String name;
  String picURL;

  factory User({id, token, name}) {
    _instance.id = id;
    _instance.token = token;
    _instance.name = name;

    return _instance;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    //_instance.id = json['user']['id'];
    _tempUserTest();

    return _instance;
  }

  static _tempUserTest() {
    _instance.id = "001";
    _instance.token = "a123e";
    _instance.name = "Denis Ken";
    _instance.picURL =
        "https://scontent-gru1-1.xx.fbcdn.net/v/t1.0-9/50335311_2024197577645281_3658935961481379840_o.jpg?_nc_cat=106&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeH7m4WKfX84oiyxnFlwxB8YUcC1umpqAdlRwLW6amoB2Q2hbmQRVD1mWiuL1Z1ti6XCQBRYnzTgMmZ4CMQjqoiT&_nc_ohc=-n4wDPUWli8AX9CZ57q&_nc_ht=scontent-gru1-1.xx&oh=26d316d640e118b20c4b99da0dd50f48&oe=60270A75";
  }

  static User get instance => _instance;
  User._internal();
}
