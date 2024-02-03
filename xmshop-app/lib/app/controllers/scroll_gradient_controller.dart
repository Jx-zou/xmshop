import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

const double maxOffset = 75;

class ScrollGradientController extends BaseController {
  final double maxSize;
  final RxDouble ratio = 0.0.obs;
  final ScrollController scrollController;

  ScrollGradientController({
    required this.scrollController,
    this.maxSize = maxOffset,
  });

  void _addScrollListener() {
    scrollController.addListener(() {
      double offset = scrollController.offset;
      if (offset <= maxSize) {
        ratio.value = offset / maxSize;
        update();
        return;
      }
      if (ratio.value != 1) {
        ratio.value = 1;
        update();
      }
    });
  }

  @override
  void init() {
    _addScrollListener();
  }

  @override
  void close() {
    scrollController.dispose();
  }
}
