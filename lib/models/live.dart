class Live {
  String cover;
  bool started;
  bool ended;

  String id;
  String title;
  String date;
  String description;

  String mentorId;

  String channelName;
  String channelToken;

  Live.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    started = json['started'];
    ended = json['ended'];

    id = json['id'];
    title = json['title'];
    date = json['date'];
    description = json['description'];

    mentorId = json['mentorId'];

    channelName = json['channelName'];
    channelToken = json['channelToken'];

  }
}
