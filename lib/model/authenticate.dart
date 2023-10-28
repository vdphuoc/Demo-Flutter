import 'dart:convert';
import 'package:flutter/services.dart';
import 'userModel.dart';

Future<List<User>> fetchUsers() async {
  final String data = await rootBundle.loadString('json/users.json');
  final List<dynamic> jsonList = json.decode(data);
  return jsonList
      .map((json) => User(json['username'], json['password']))
      .toList();
}

Future<bool> authenticateUser(String username, String password) async {
  final List<User> users = await fetchUsers();
  for (User user in users) {
    if (user.username == username && user.password == password) {
      return true;
    }
  }
  return false;
}
