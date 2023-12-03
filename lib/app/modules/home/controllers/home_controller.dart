import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import 'home_best_banner_controller.dart';
import 'home_best_list_controller.dart';
import 'home_category_controller.dart';
import 'home_hot_list_controller.dart';
import 'home_hot_swiper_controller.dart';
import 'home_main_swiper_controller.dart';

class HomeController extends BaseController {
  static const double maxOffset = 135;
  final Rx<Color> actionColor = Colors.white.obs;
  final RxDouble ratio = 0.0.obs;
  final ScrollController scrollController = ScrollController();

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset <= maxOffset) {
        ratio.value = scrollController.offset / maxOffset;
        actionColor.value = Colors.white;
        update();
        return;
      }
      if (ratio.value != 1) {
        ratio.value = 1;
        actionColor.value = Colors.black54;
      }
      update();
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

  @override
  void reset() {
    Get.find<HomeBestBannerController>().onRefresh();
    Get.find<HomeBestListController>().onRefresh();
    Get.find<HomeCategoryController>().onRefresh();
    Get.find<HomeHotListController>().onRefresh();
    Get.find<HomeHotSwiperController>().onRefresh();
    Get.find<HomeMainSwiperController>().onRefresh();
  }
}
