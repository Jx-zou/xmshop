import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'home_ad_view.dart';
import 'home_best_view.dart';
import 'home_best_waterfall_view.dart';
import 'home_category_view.dart';
import 'home_hot_view.dart';
import 'home_main_swiper_view.dart';
import 'home_qa_banner_view.dart';

class HomeBodyView extends GetView<HomeController> {
  const HomeBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        edgeOffset: 50.0,
        onRefresh: () => controller.onRefresh(),
        child: ListView(controller: controller.scrollController, children: [
          Container(
            color: Colors.white,
            child: const Column(children: [
              HomeMainSwiperView(),
              HomeQaBannerView(),
              HomeCategoryView(),
              HomeAdView(),
              HomeHotView(),
              HomeBestView(),
            ]),
          ),
          const HomeBestWaterfallView()
        ]),
      ),
    );
  }
}
