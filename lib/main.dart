import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/routes/app_pages.dart';

import 'handler.dart';
import 'config.dart';

void run() {
  runApp(ScreenUtilInit(
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      title: Config.appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Config.themeData,
      defaultTransition: Transition.rightToLeft,
    ),
  ));
}

void main() {
  ExceptionHandler(() {
    ServiceHandler.instance.initialize();
    run();
  });
}
