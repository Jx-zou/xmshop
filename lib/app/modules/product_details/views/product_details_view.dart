import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/round_rect_button.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_bottom_view.dart';
import 'product_details_evaluate_view.dart';
import 'product_details_goods_view.dart';
import 'product_details_more_view.dart';
import 'product_details_recommended_view.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  _action({required VoidCallback onPressed, required IconData icon, EdgeInsetsGeometry? margin}) {
    return Container(
        margin: margin,
        alignment: Alignment.center,
        child: RoundRectButton(
            onPressed: onPressed,
            width: ScreenAdapter.width(81),
            height: ScreenAdapter.width(81),
            color: Colors.black54
                .withOpacity(0.38 * (1 - controller.appBarOpacity.value)),
            elevation: 0,
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(30)),
            child: Icon(icon,
                size: ScreenAdapter.width(40),
                color: controller.actionColor.value)));
  }

  _moreTar() {
    return Container(
        color: Colors.white,
        height: ScreenAdapter.height(100),
        child: Obx(() =>
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              InkWell(
                  highlightColor: Colors.transparent,
                  radius: 0,
                  onTap: () => controller.changeMoreSelected(1),
                  child: Text("商品介绍",
                      style: TextStyle(
                          color: controller.moreSelected.value == 1
                              ? Colors.redAccent
                              : null))),
              InkWell(
                  highlightColor: Colors.transparent,
                  radius: 0,
                  onTap: () => controller.changeMoreSelected(2),
                  child: Text("规格参数",
                      style: TextStyle(
                          color: controller.moreSelected.value == 2
                              ? Colors.redAccent
                              : null)))
            ])));
  }

  _bodyView() {
    return SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(children: [
          ProductDetailsGoodsView(key: controller.tannerTitles[0]['contentKey']),
          ProductDetailsEvaluateView(key: controller.tannerTitles[1]['contentKey']),
          ProductDetailsMoreView(_moreTar(), key: controller.tannerTitles[2]['contentKey']),
          ProductDetailsRecommendedView(key: controller.tannerTitles[3]['contentKey'])
        ]));
  }

  _appBarView(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(150)),
        child: Obx(() => AppBar(
                leading: _action(
                    onPressed: () {
                      Get.back();
                    },
                    icon: XmshopIcons.arrowLeft),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: controller.tannerTitles
                        .map((value) => InkWell(
                            onTap: () {
                              controller.onTarTitlePressed(value['id']);
                            },
                            child: Column(
                              children: [
                                SizedBox(height: ScreenAdapter.height(20)),
                                Text(value['title'],
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(35),
                                        color: value['id'] ==
                                                controller.selectedId.value
                                            ? Colors.red.withOpacity(
                                                controller.appBarOpacity.value)
                                            : Colors.black.withOpacity(
                                                controller
                                                    .appBarOpacity.value))),
                                Container(
                                    margin: EdgeInsets.only(
                                        top: ScreenAdapter.height(20)),
                                    width: ScreenAdapter.width(50),
                                    height: ScreenAdapter.height(5),
                                    color: value['id'] ==
                                            controller.selectedId.value
                                        ? Colors.red.withOpacity(
                                            controller.appBarOpacity.value)
                                        : Colors.transparent)
                              ]
                            )))
                        .toList()),
                centerTitle: true,
                backgroundColor: Colors.white.withOpacity(controller.appBarOpacity.value),
                elevation: 0,
                actions: [
                  _action(
                      onPressed: () {},
                      icon: XmshopIcons.share,
                      margin: EdgeInsets.only(right: ScreenAdapter.width(40))),
                  _action(
                      onPressed: () => showMenu(
                          elevation: 0,
                          color: Colors.black87.withOpacity(0.2),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  ScreenAdapter.width(20))),
                          context: context,
                          position: RelativeRect.fromLTRB(
                              ScreenAdapter.width(600),
                              ScreenAdapter.height(250),
                              0,
                              0),
                          items: controller.moreMenu
                              .map((v) => PopupMenuItem(
                                      child: Row(
                                    children: [
                                      Icon(v['icon'], color: Colors.white),
                                      Text("${v['title']}",
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenAdapter.fontSize(28),
                                              color: Colors.white))
                                    ],
                                  )))
                              .toList()),
                      icon: XmshopIcons.more,
                      margin: EdgeInsets.only(right: ScreenAdapter.width(40)))
                ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBarView(context),
        body: Obx(() => Stack(children: [
              _bodyView(),
              const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ProductDetailsBottomView()),
              controller.showMoreTar.isTrue
                  ? Positioned(
                      top: ScreenAdapter.height(225),
                      left: 0,
                      right: 0,
                      child: _moreTar())
                  : const SizedBox()
            ])));
  }
}
