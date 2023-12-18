import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/home_controller.dart';
import 'home_advertisement_view.dart';
import 'home_best_view.dart';
import 'home_best_waterfall_view.dart';
import 'home_category_view.dart';
import 'home_hot_view.dart';
import 'home_main_swiper_view.dart';

class HomeBodyView extends GetView<HomeController> {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: ListView(controller: controller.scrollController, children: [
          const HomeMainSwiperView(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: ScreenAdapter.height(30),
            ),
            child: Image.asset("assets/images/xiaomiBanner.png",
                fit: BoxFit.cover),
          ),
          const HomeCategoryView(),
          const HomeAdvertisementView(),
          const HomeHotView(),
          const HomeBestView(),
          const HomeBestWaterfallView()
        ]),
      ),
    );
  }
}
