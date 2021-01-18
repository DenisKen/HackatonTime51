import 'dart:convert';

import 'package:Discere/models/live.dart';
import 'package:Discere/services/server_service.dart';
import 'package:flutter/material.dart';

class DiscoverLivesNotifier extends ChangeNotifier {
  List lives;

  Future<void> update() async {
    var response = await ServerService.instance.getLives();

    print(response.statusCode);
    print(jsonDecode(response.body));
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      lives = jsonDecode(response.body)['lives']
          .map((data) => Live.fromJson(data))
          .toList();

      print("---------");
      print(lives.length);
      print(lives[0].title);

      notifyListeners();
    }
  }
}
