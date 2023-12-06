import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_details_body_view.dart';
import '../controllers/product_details_controller.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/round_rect_button.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  _action(
      {required VoidCallback onPressed,
      required IconData icon,
      EdgeInsetsGeometry? margin}) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(ScreenAdapter.height(150)),
            child: Obx(() => AppBar(
                    leading: _action(
                        icon: XmshopIcons.arrowLeft,
                        onPressed: () {
                          Get.back();
                        }),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.tannerTitles
                            .map((value) => InkWell(
                                onTap: () {
                                  controller.onTarTitlePressed(value['id']);
                                },
                                child: Column(children: [
                                  SizedBox(height: ScreenAdapter.height(20)),
                                  Text(value['title'],
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(35),
                                          color: value['id'] ==
                                                  controller.selectedId.value
                                              ? Colors.red.withOpacity(
                                                  controller
                                                      .appBarOpacity.value)
                                              : Colors.black.withOpacity(
                                                  controller
                                                      .appBarOpacity.value))),
                                  Container(
                                      margin: EdgeInsets.only(top: ScreenAdapter.height(20)),
                                      width: ScreenAdapter.width(50),
                                      height: ScreenAdapter.height(5),
                                      color: value['id'] ==
                                              controller.selectedId.value
                                          ? Colors.red.withOpacity(
                                              controller.appBarOpacity.value)
                                          : Colors.transparent)
                                ])))
                            .toList()),
                    centerTitle: true,
                    backgroundColor:  Color.fromRGBO(255, 255, 255, controller.appBarOpacity.value),
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
                                                      ScreenAdapter.fontSize(
                                                          28),
                                                  color: Colors.white))
                                        ],
                                      )))
                                  .toList()),
                          icon: XmshopIcons.more,
                          margin:
                              EdgeInsets.only(right: ScreenAdapter.width(40)))
                    ]))),
        body: const ProductDetailsBodyView());
  }
}
