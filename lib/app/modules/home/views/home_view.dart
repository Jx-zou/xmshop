import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_controller.dart';
import 'home_advertisement_view.dart';
import 'home_best_goods_banner_view.dart';
import 'home_best_goods_list_view.dart';
import 'home_category_view.dart';
import 'home_hot_goods_list_view.dart';
import 'home_hot_goods_swiper_view.dart';
import 'home_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _actionButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenAdapter.width(40)),
      child: InkResponse(onTap: onPressed, child: Icon(icon)),
    );
  }

  Widget _bestGoodsView() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(25), right: ScreenAdapter.width(25)),
            child: TitleBanner("省心优惠",
                right: "全部优惠",
                icon: XmshopIcons.arrowRight,
                leftSize: ScreenAdapter.fontSize(48),
                rightSize: ScreenAdapter.fontSize(38))),
        Container(
            color: Colors.white38,
            height: ScreenAdapter.height(350),
            child: const HomeBestGoodsBannerView()),
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(25),
                right: ScreenAdapter.width(25),
                top: ScreenAdapter.width(25)),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white38, Colors.white24, Colors.white10],
                    stops: [0.0, 0.1, 1.0])),
            child: const HomeBestGoodsListView())
      ],
    );
  }

  Widget _hotGoodsView() {
    return Column(
      children: [
        TitleBanner("热销甄选",
            right: "更多手机",
            icon: XmshopIcons.arrowRight,
            leftSize: ScreenAdapter.fontSize(48),
            rightSize: ScreenAdapter.fontSize(38)),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: ScreenAdapter.height(10),
                            bottom: ScreenAdapter.height(10)),
                        child:
                            const SizedBox(child: HomeHotGoodsSwiperView())))),
            SizedBox(width: ScreenAdapter.width(20)),
            Expanded(
                flex: 1,
                child: SizedBox(
                    height: ScreenAdapter.height(738),
                    child: const HomeHotGoodsListView()))
          ],
        )
      ],
    );
  }

  Widget _bodyView() => RefreshIndicator(onRefresh: () => controller.onRefresh(), child: ListView(
    controller: controller.scrollController,
    children: [
      SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(682),
        child: const HomeSwiperView(),
      ),
      SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(92),
        child: Image.asset("assets/images/xiaomiBanner.png",
            fit: BoxFit.cover),
      ),
      Container(
          padding: EdgeInsets.all(ScreenAdapter.width(15)),
          color: Colors.white,
          width: ScreenAdapter.width(1080),
          height: ScreenAdapter.height(500),
          child: const HomeCategoryView()),
      Padding(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20),
            ScreenAdapter.height(20), ScreenAdapter.width(20), 0),
        child: const HomeAdvertisementView(),
      ),
      Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(30)),
          child: _hotGoodsView()),
      _bestGoodsView(),
    ],
  ));

  _appBarView() => PreferredSize(
      preferredSize: Size.fromHeight(ScreenAdapter.height(150)),
      child: Obx(() => AppBar(
          leadingWidth: 0,
          title: Container(
              alignment: Alignment.centerRight,
              child: Stack(
                fit: StackFit.passthrough,
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Icon(
                    XmshopIcons.logo,
                    color:
                        Colors.white.withOpacity(1 - controller.opacity.value),
                    size: 32,
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: ScreenAdapter.width(135 - controller.opacity.value * HomeController.maxOffset)),
                      width: ScreenAdapter.width(650 + controller.opacity.value * HomeController.maxOffset),
                      height: ScreenAdapter.height(110),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(230, 240, 245, 245),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                  ScreenAdapter.width(34),
                                  0,
                                  ScreenAdapter.width(10),
                                  0),
                              child: const Icon(XmshopIcons.search,
                                  size: 20, color: Colors.black26)),
                          Text(
                            "手机",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Get.toNamed("/search");
                    },
                  )
                ],
              )),
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          elevation: 0,
          actions: [
            _actionButton(XmshopIcons.qrcode, () {}),
            _actionButton(XmshopIcons.message, () {})
          ],
          actionsIconTheme: IconThemeData(
              size: ScreenAdapter.fontSize(64),
              color: controller.actionColor.value))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBarView(),
        body: MediaQuery.removePadding(
            context: context, removeTop: true, child: _bodyView()));
  }
}
