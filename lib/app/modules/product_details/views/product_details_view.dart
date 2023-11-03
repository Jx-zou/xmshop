import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/round_rect_button.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  showMoreMenu(BuildContext context) {
    showMenu(
        elevation: 0,
        color: Colors.black87.withOpacity(0.2),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
        context: context,
        position: RelativeRect.fromLTRB(
            ScreenAdapter.width(600), ScreenAdapter.height(250), 0, 0),
        items: controller.moreMenu
            .map((v) => PopupMenuItem(
                    child: Row(
                  children: [
                    Icon(v['icon'], color: Colors.white),
                    Text("${v['title']}",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(28),
                            color: Colors.white))
                  ],
                )))
            .toList());
  }

  _bodyView() {
    return SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(children: [
          Container(
            key: controller.tarTitles[0]['contentKey'],
            color: Colors.red,
            height: 500,
          ),
          Container(
            key: controller.tarTitles[1]['contentKey'],
            height: 500,
            color: Colors.grey,
          ),
          Container(
            key: controller.tarTitles[2]['contentKey'],
            height: 1000,
            color: Colors.green,
          ),
          Container(
            key: controller.tarTitles[3]['contentKey'],
            height: 1000,
            color: Colors.blue,
          ),
        ]));
  }

  _appBarView(BuildContext context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.height(150)),
        child: Obx(() => AppBar(
              leading: Container(
                  alignment: Alignment.center,
                  child: RoundRectButton(
                      onPressed: () {},
                      size: ScreenAdapter.width(81),
                      backgroundColor: Colors.black.withOpacity(
                          0.38 * (1 - controller.appBarOpacity.value)),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      borderRadius: ScreenAdapter.width(30),
                      child: Icon(XmshopIcons.back,
                          size: ScreenAdapter.width(40),
                          color: controller.actionColor.value))),
              title: controller.showTabs.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: controller.tarTitles
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
                                              ? Colors.red
                                              : Colors.black)),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: ScreenAdapter.height(20)),
                                      width: ScreenAdapter.width(50),
                                      height: ScreenAdapter.height(5),
                                      color: value['id'] ==
                                              controller.selectedId.value
                                          ? Colors.red
                                          : Colors.transparent)
                                ],
                              )))
                          .toList())
                  : Container(),
              centerTitle: true,
              backgroundColor:
                  Colors.white.withOpacity(controller.appBarOpacity.value),
              elevation: 0,
              actions: [
                Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
                    alignment: Alignment.center,
                    child: RoundRectButton(
                        onPressed: () {},
                        size: ScreenAdapter.width(81),
                        backgroundColor: Colors.black.withOpacity(
                            0.38 * (1 - controller.appBarOpacity.value)),
                        elevation: 0,
                        borderRadius: ScreenAdapter.width(30),
                        child: Icon(XmshopIcons.share,
                            size: ScreenAdapter.width(40),
                            color: controller.actionColor.value))),
                Container(
                    margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
                    alignment: Alignment.center,
                    child: RoundRectButton(
                        onPressed: () => showMoreMenu(context),
                        size: ScreenAdapter.width(81),
                        backgroundColor: Colors.black54.withOpacity(
                            0.38 * (1 - controller.appBarOpacity.value)),
                        elevation: 0,
                        borderRadius: ScreenAdapter.width(30),
                        child: Icon(XmshopIcons.more,
                            size: ScreenAdapter.width(40),
                            color: controller.actionColor.value)))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBarView(context),
        body: _bodyView());
  }
}
