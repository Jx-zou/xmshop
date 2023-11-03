import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService extends GetxService {

  late final SharedPreferences _prefs;

  set(String key, dynamic value) async {
    _prefs.setString(key, json.encode(value));
  }

  get(String key) async {
    try {
      String? jsonValue = _prefs.getString(key);
      if (jsonValue != null) {
        return json.decode(jsonValue);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  remove(String key) async {
    _prefs.remove(key);
  }

  clear() async {
    _prefs.clear();
  }

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  void onInit() {
    super.onInit();
    init();
  }
}
