import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Config {
  Config._();

  static const String appTitle = "XmShop";
  static const String serverApi = "https://xiaomi.itying.com/api";
  static const String server = "https://xiaomi.itying.com/";

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: "miFont",
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black54,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    ),
  );
}
