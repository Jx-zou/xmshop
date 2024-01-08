import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Config {
  Config._();

  static const String title = "XmShop";
  static const String server = "https://xiaomi.itying.com/";
  static const String serverApi = "https://xiaomi.itying.com/api";

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: "font",
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
    ),
    textTheme: const TextTheme(

    ),
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
