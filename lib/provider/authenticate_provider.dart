import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/user_model.dart';

class AuthenticateProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;
  static String tempUser = "NaN";

  AuthenticateProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final String data = await rootBundle.loadString('assets/json/users.json');
    final List<dynamic> jsonList = json.decode(data);
    _users = jsonList
        .map((json) => User(json['username'], json['password']))
        .toList();
    notifyListeners();
  }

  bool authenticateUser(String username, String password) {
    for (User user in _users) {
      if (user.username == username && user.password == password) {
        print(r"fetch...." + user.username);
        updateTempUser(user.username);
        return true;
      }
    }

    return false;
  }

  void updateTempUser(String username) {
    tempUser = username;
    print('update ::: $tempUser');
  }

  static String currentUser() {
    print(r'current funct ' + tempUser);
    return tempUser;
  }
}
