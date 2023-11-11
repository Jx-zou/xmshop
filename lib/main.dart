import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/search_service.dart';
import 'package:xmshop/app/services/storage_service.dart';

import 'app/routes/app_pages.dart';

void initService() {
  Get.put(() => StorageService());
  Get.put(() => SearchService());
}

void run() {
  runApp(ScreenUtilInit(
    designSize: const Size(1080, 2400),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "miFont"
      ),
      defaultTransition: Transition.rightToLeft,
    ),
  ));
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));  

  initService();
  run();
}

