import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/home_controller.dart';
import 'home_advertisement_view.dart';
import 'home_best_view.dart';
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
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(682),
                child: const HomeMainSwiperView(),
              ),
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(92),
                child: Image.asset("assets/images/xiaomiBanner.png", fit: BoxFit.cover)
              ),
              Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(15)),
                  color: Colors.white,
                  width: ScreenAdapter.width(1080),
                  height: ScreenAdapter.height(500),
                  child: const HomeCategoryView()),
              Padding(
                padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
                child: const HomeAdvertisementView()
              ),
              Padding(
                  padding: EdgeInsets.all(ScreenAdapter.width(30)),
                  child: const HomeHotView()),
              const HomeBestView()
            ])));
  }
}






