import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import 'home_best_goods_banner_controller.dart';
import 'home_best_goods_list_controller.dart';
import 'home_category_controller.dart';
import 'home_hot_goods_list_controller.dart';
import 'home_hot_goods_swiper_controller.dart';
import 'home_swiper_controller.dart';

class HomeController extends BaseController {
  static const double maxOffset = 135;
  final Rx<Color> actionColor = Colors.white.obs;
  final RxDouble opacity = 0.0.obs;
  final ScrollController scrollController = ScrollController();

  void _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset <= maxOffset) {
        opacity.value = scrollController.offset / maxOffset;
        actionColor.value = Colors.white;
        update();
        return;
      }
      if (opacity.value != 1) {
        opacity.value = 1;
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
    Get.find<HomeBestGoodsBannerController>().onRefresh();
    Get.find<HomeBestGoodsListController>().onRefresh();
    Get.find<HomeCategoryController>().onRefresh();
    Get.find<HomeHotGoodsListController>().onRefresh();
    Get.find<HomeHotGoodsSwiperController>().onRefresh();
    Get.find<HomeSwiperController>().onRefresh();
  }
}
