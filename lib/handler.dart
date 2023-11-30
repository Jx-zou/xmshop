import 'dart:ui';

import 'package:flutter/material.dart';

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
    ErrorWidget.builder = (details) =>
        errorWidget ??
        Container(
          alignment: Alignment.center,
          child: const Text("页面走丢了~"),
        );
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
