import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xmshop/handler.dart';

import 'app/routes/app_pages.dart';

import 'app/services/cart_service.dart';
import 'app/services/search_service.dart';
import 'app/services/storage_service.dart';

import 'config.dart';

void initService() {
  Get.lazyPut(() => StorageService());
  Get.lazyPut(() => SearchService());
  Get.lazyPut(() => CartService());
}

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
    initService();
    run();
  });
}

