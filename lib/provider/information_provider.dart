// ignore_for_file: recursive_getters, avoid_print

import 'dart:convert';

import 'package:demo_oct_16/model/user_model.dart';
import 'package:demo_oct_16/provider/authenticate_provider.dart';
import 'package:demo_oct_16/screens/profile.dart';
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

  GenderOption? _genderText = GenderOption.male;
  GenderOption? get genderOption {
    return _genderText =
        (gender == 0) ? GenderOption.female : GenderOption.male;
  }

  bool isDataLoaded = false;
  late String currentLoginUser;

  String loadCurrentuser() {
    currentLoginUser = AuthenticateProvider.currentUser();
    return currentLoginUser;
  }

  Future<void> loadDataFromJson() async {
    loadCurrentuser();
    if (!isDataLoaded) {
      try {
        final jsonString =
            await rootBundle.loadString('assets/json/profile.json');
        final jsonMap = json.decode(jsonString);

        for (var entry in jsonMap) {
          if (entry['username'] == currentLoginUser) {
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

  void setGenderOption(GenderOption? value) {
    _genderText = value;
    notifyListeners();
  }
}
