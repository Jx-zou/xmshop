import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/scroll_gradient_controller.dart';
import 'home_best_banner_controller.dart';
import 'home_best_waterfall_controller.dart';
import 'home_category_controller.dart';
import 'home_hot_list_controller.dart';
import 'home_hot_swiper_controller.dart';
import 'home_main_swiper_controller.dart';

class HomeController extends ScrollGradientController{
  HomeController() : super(scrollController: ScrollController());

  @override
  void reset() {
    Get.find<HomeBestBannerController>().onRefresh();
    Get.find<HomeBestWaterfallController>().onRefresh();
    Get.find<HomeCategoryController>().onRefresh();
    Get.find<HomeHotListController>().onRefresh();
    Get.find<HomeHotSwiperController>().onRefresh();
    Get.find<HomeMainSwiperController>().onRefresh();
  }
}
