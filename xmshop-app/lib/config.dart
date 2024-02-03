import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Config {
  Config._();

  static const String title = "XmShop";
  static const String server = "https://www.jxzou.com/xmshop/";
  static const String serverApi = "https://www.jxzou.com/xmshop/api";

  static final ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: "font",
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: Colors.white,
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black54,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    ),
  );
}
