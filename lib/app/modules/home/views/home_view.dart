import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_fonts.dart';
import '../../../common/views/title_banner.dart';
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

  Widget _bestGoodsView() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(25), right: ScreenAdapter.width(25)),
            child: TitleBanner("省心优惠", subTitle: "全部优惠",
                mainSize: ScreenAdapter.fontSize(48),
                secondSize: ScreenAdapter.fontSize(38))),
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
                    colors: [
                  Colors.white38,
                  Colors.white24,
                  Colors.white10
                ],
                    stops: [
                  0.0,
                  0.1,
                  1.0
                ])),
            child: const HomeBestGoodsListView())
      ],
    );
  }

  Widget _hotGoodsView() {
    return Column(
      children: [
        TitleBanner("热销甄选", subTitle: "更多手机",
            mainSize: ScreenAdapter.fontSize(48),
            secondSize: ScreenAdapter.fontSize(38)),
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

  Widget _bodyView() => Positioned(
      top: -40,
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
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

  Widget _barView() => Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Obx(() => AppBar(
          titleSpacing: 0,
          leading: Icon(
            XmshopFonts.xiaomi,
            color: Color.fromARGB(
                (255 * (1 - controller.offsetProportion.value)).toInt(),
                255,
                255,
                255),
            size: 32,
          ),
          leadingWidth: ScreenAdapter.width(
              200 * (1 - controller.offsetProportion.value)),
          title: InkWell(
            child: Container(
              width: ScreenAdapter.width(620 + controller.offset.value * 1.5),
              height: ScreenAdapter.height(110),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 240, 245, 245),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                      child: const Icon(XmshopFonts.search,
                          size: 20, color: Colors.black26)),
                  Text(
                    "${controller.offset.value}",
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
          ),
          backgroundColor: controller.flag.value
              ? Color.fromARGB(
                  (255 * controller.offsetProportion.value).toInt(),
                  255,
                  255,
                  255)
              : Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.qr_code)),
            IconButton(onPressed: () {}, icon: const Icon(XmshopFonts.message))
          ],
          actionsIconTheme: IconThemeData(
              size: 28,
              color: controller.flag.value ? Colors.black54 : Colors.white))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_bodyView(), _barView()],
    ));
  }
}
