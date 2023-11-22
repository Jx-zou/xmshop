import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'global.dart';
import 'app/routes/app_pages.dart';
import 'app/services/search_service.dart';
import 'app/services/storage_service.dart';

void initService() {
  Get.lazyPut(() => StorageService());
  Get.lazyPut(() => SearchService());
}

void run() {
  runApp(ScreenUtilInit(
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      title: Global.appTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: Global.themeData,
      defaultTransition: Transition.rightToLeft,
    ),
  ));
}

void main() {
  initService();
  run();
}

