import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_shop_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/title_banner.dart';
import '../controllers/home_controller.dart';
import 'home_ad_view.dart';
import 'home_best_bar_view.dart';
import 'home_best_waterfall_view.dart';
import 'home_category_view.dart';
import 'home_hot_list_view.dart';
import 'home_hot_swiper_view.dart';
import 'home_main_swiper_view.dart';
import 'home_qa_banner_view.dart';

class HomeBodyView extends GetView<HomeController> {
  const HomeBodyView({super.key});

  Widget _swiperView() {
    return SizedBox(
      height: ScreenAdapter.height(682),
      child: const HomeMainSwiperView(),
    );
  }

  Widget _hotView() {
    return Padding(
      padding: EdgeInsets.all(
        ScreenAdapter.width(30),
      ),
      child: Column(children: [
        TitleBanner(
          "热销甄选",
          right: "更多手机",
          icon: XmShopIcons.arrowRight,
          leftSize: ScreenAdapter.fontSize(48),
          rightSize: ScreenAdapter.fontSize(38),
        ),
        Row(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: ScreenAdapter.height(738),
              child: const HomeHotSwiperView(),
            ),
          ),
          SizedBox(
            width: ScreenAdapter.width(20),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: ScreenAdapter.height(738),
              child: const HomeHotListView(),
            ),
          )
        ])
      ]),
    );
  }

  Widget _bestView() {
    return Column(children: [
      Container(
        padding: EdgeInsets.only(
          left: ScreenAdapter.width(25),
          right: ScreenAdapter.width(25),
        ),
        child: TitleBanner(
          "省心优惠",
          right: "全部优惠",
          icon: XmShopIcons.arrowRight,
          leftSize: ScreenAdapter.fontSize(48),
          rightSize: ScreenAdapter.fontSize(38),
        ),
      ),
      SizedBox(
        height: ScreenAdapter.height(350),
        child: const HomeBestBarView(),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: RefreshIndicator(
        edgeOffset: 50.0,
        onRefresh: () => controller.onRefresh(),
        child: ListView(controller: controller.scrollController, children: [
          Material(
            color: Colors.white,
            child: Column(children: [
              _swiperView(),
              const HomeQaBannerView(),
              const HomeCategoryView(),
              const HomeAdView(),
              _hotView(),
              _bestView(),
            ]),
          ),
          const HomeBestWaterfallView()
        ]),
      ),
    );
  }
}
