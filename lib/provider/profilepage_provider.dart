// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  bool isEditing = false;
  String btnValue = "Edit Profile";

  void toggleEditing() {
    isEditing = !isEditing;
    btnValue = isEditing ? "Save" : "Edit Profile";
    print('$isEditing and $btnValue');
    notifyListeners();
  }
}
