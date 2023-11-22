import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Global {
  static const String appTitle = "XmShop";
  static const String serverApi = "https://xiaomi.itying.com/api";
  static const String server = "https://xiaomi.itying.com/";

  static ThemeData themeData = ThemeData(
    fontFamily: "miFont",
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.white,
      foregroundColor: Colors.black87,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.transparent,
      ),
    ),
  );
}
