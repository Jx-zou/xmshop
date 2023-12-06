import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/common/views/status/error_view.dart';
import 'app/services/cart_service.dart';
import 'app/services/search_service.dart';
import 'app/services/storage_service.dart';

class ExceptionHandler {
  final Widget? errorWidget;
  final void Function(FlutterErrorDetails details)? flutterErrorFunction;
  final void Function(Object error, StackTrace stack)? zoneErrorFunction;
  final void Function() run;

  ExceptionHandler(
    this.run, {
    this.errorWidget,
    this.flutterErrorFunction,
    this.zoneErrorFunction,
  }) {
    initialize();
  }

  void initialize() {
    errorWidgetInitialize();
    flutterErrorInitialize();
    zoneErrorInitialize();
    run();
  }

  void errorWidgetInitialize() {
    ErrorWidget.builder =
        (details) => errorWidget ?? const ErrorView("该页面走丢了~~");
  }

  void flutterErrorInitialize() {
    var function = flutterErrorFunction ?? (FlutterErrorDetails details) {};
    FlutterError.onError = (details) {
      function(details);
    };
  }

  void zoneErrorInitialize() {
    var function = zoneErrorFunction ?? (Object error, StackTrace stack) {};
    PlatformDispatcher.instance.onError = (error, stack) {
      function(error, stack);
      return true;
    };
  }
}

class ServiceHandler {
  ServiceHandler._();

  static final ServiceHandler instance = ServiceHandler._();

  initialize() {
    Get.lazyPut(() => StorageService());
    Get.lazyPut(() => SearchService());
    Get.lazyPut(() => CartService());
  }
}
