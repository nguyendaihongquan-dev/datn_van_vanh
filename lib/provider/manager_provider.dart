import 'package:datn_van_vanh/model/user_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ManagerProvider extends ChangeNotifier {
  late final DatabaseReference databaseReference;
  // final ValueNotifier<bool> isSwitchOn = ValueNotifier<bool>(false);
  // void initDevice(String path) {
  //   databaseReference =
  //       FirebaseDatabase.instance.ref('/parking/status').child(path);
  // }

  void setupStream(ValueNotifier<bool> status) {
    databaseReference.onValue.listen((event) {
      final dynamic data = event.snapshot.value;
      if (data != null && data is bool) {
        status.value = data;
      }
    });
  }

  int space = 0;
  void updateSpace(int value) {
    space = value;
    notifyListeners();
  }

  
}
