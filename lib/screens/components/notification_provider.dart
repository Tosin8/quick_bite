
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider with ChangeNotifier {
  bool _isNotificationEnabled = false;

  bool get isNotificationEnabled => _isNotificationEnabled;

  NotificationProvider() {
    _loadFromPrefs();
  }

  void setNotificationEnabled(bool value) {
    _isNotificationEnabled = value;
    _saveToPrefs();
    notifyListeners();
  }

  void _loadFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isNotificationEnabled = prefs.getBool('isNotificationEnabled') ?? false;
    notifyListeners();
  }

  void _saveToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isNotificationEnabled', _isNotificationEnabled);
  }
}


