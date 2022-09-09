import 'dart:math';
import 'package:flutter/material.dart';

class CheckBoxProvider with ChangeNotifier {
  bool isValue = false;
  bool isValueProgramming = false;
  bool isValueOS = false;
  bool isValueMsOffice = false;
  bool isValueMsAccess = false;
  bool isValueIT = false;
  bool isValueEcomAndWeb = false;

  bool get isChecked => isValue;

  set isChecked(bool value) {
    isValue = value;
    notifyListeners();
  }

  set isCheckedProgramming(bool value) {
    isValueProgramming = value;
    notifyListeners();
  }

  set isCheckedOS(bool value) {
    isValueOS = value;
    notifyListeners();
  }

  set isCheckedMsOffice(bool value) {
    isValueMsOffice = value;
    notifyListeners();
  }

  set isCheckedMsAccess(bool value) {
    isValueMsAccess = value;
    notifyListeners();
  }

  set isCheckedIT(bool value) {
    isValueIT = value;
    notifyListeners();
  }

  set isCheckedEcomAndWeb(bool value) {
    isValueEcomAndWeb = value;
    notifyListeners();
  }
}
