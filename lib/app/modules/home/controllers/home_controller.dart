import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const double maxOffset = 75;
  final Rx<Color> actionColor = Colors.white.obs;
  final RxDouble opacity = 0.0.obs;
  final ScrollController scrollController = ScrollController();

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset <= maxOffset) {
        opacity.value = scrollController.offset / 75;
        actionColor.value = Colors.white;
        update();
        return;
      }
      actionColor.value = Colors.black54;
      update();
    });
  }

  @override
  void onInit() {
    super.onInit();
    _addScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
