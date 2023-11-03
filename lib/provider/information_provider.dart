// ignore_for_file: recursive_getters, avoid_print

import 'dart:convert';

import 'package:demo_oct_16/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InforProvider with ChangeNotifier {
  Information information = Information(
      id: 0,
      username: "initalUsername",
      name: "initalName",
      birth: "initalBirth",
      gender: 0);

  int get id => information.id;
  String get username => information.username;
  String get name => information.name;
  String get birth => information.birth;
  int get gender => information.gender;

  bool isDataLoaded = false;
  Future<void> loadDataFromJson(int idToFind) async {
    if (!isDataLoaded) {
      try {
        final jsonString =
            await rootBundle.loadString('assets/json/profile.json');
        final jsonMap = json.decode(jsonString);

        for (var entry in jsonMap) {
          if (entry['id'] == idToFind) {
            print(entry);
            final id = entry['id'] as int;
            final username = entry['username'] as String;
            final name = entry['name'] as String;
            final birth = entry['birth'] as String;
            final gender = entry['gender'] as int;
            information = Information(
              id: id,
              username: username,
              name: name,
              birth: birth,
              gender: gender,
            );
            isDataLoaded = true;
            notifyListeners();
            break;
          }
        }
      } catch (e) {
        print('Error loading data: $e');
      }
    }
  }

  void reloadData() {
    notifyListeners();
  }
}
