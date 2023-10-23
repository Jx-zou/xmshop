import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static const double maxOffset = 75;
  final RxBool flag = false.obs;
  final RxDouble offset = RxDouble(0);
  final RxDouble offsetProportion = RxDouble(0);
  final ScrollController scrollController = ScrollController();

  void _addScrollListener() {
    scrollController.addListener(() {
      double pixels = scrollController.position.pixels;

      if (pixels < 10) {
        if (flag.value) {
          flag.value = false;
        }
      }
      if (pixels > 10 && pixels < maxOffset) {
        if (!flag.value) {
          flag.value = true;
        }
      }
      if (pixels > maxOffset) {
        if (offset.value == maxOffset) {
          return;
        }
        offset.value = maxOffset;
        offsetProportion.value = 1;
        update();
        return;
      }
      offset.value = pixels;
      offsetProportion.value = pixels / maxOffset;
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
