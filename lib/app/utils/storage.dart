import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static set(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static get(String key) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? jsonValue = prefs.getString(key);
      if (jsonValue != null) {
        return json.decode(jsonValue);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
