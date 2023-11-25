import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/close_bottom_sheet.dart';
import '../../../utils/screen_adapter.dart';
import '../widgets/bottom_button.dart';
import '../widgets/selected_bottom_sheet.dart';

class ProductDetailsBottomView extends GetView {
  const ProductDetailsBottomView({super.key});

  Widget _bottomButton({required String title, required List<Color> colors}) {
    return BottomButton(
        margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
        title: title,
        colors: colors,
        onPressed: () {
          Get.bottomSheet(
              CloseBottomSheet(
                  width: ScreenAdapter.width(1080),
                  height: ScreenAdapter.height(1680),
                  icon: Icon(XmshopIcons.close,
                      size: ScreenAdapter.fontSize(20), color: Colors.black87),
                  closed: () => Get.back(),
                  child: SelectedBottomSheet(
                    bottom: Padding(
                        padding: EdgeInsets.all(ScreenAdapter.width(40)),
                        child: BottomButton(
                            title: "确定",
                            colors: [
                              Colors.deepOrange.withOpacity(0.5),
                              Colors.redAccent
                            ],
                            onPressed: () {
                              Get.back();
                            })),
                  )),
              isScrollControlled: true,
              elevation: 0);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: ScreenAdapter.width(15), right: ScreenAdapter.width(10)),
        height: ScreenAdapter.height(160),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: ScreenAdapter.height(3), color: Colors.black12))),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(
                left: ScreenAdapter.width(30), right: ScreenAdapter.width(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(XmshopIcons.online, size: ScreenAdapter.width(60)),
                Text(
                  "客服",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      color: Colors.black54),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenAdapter.width(30), right: ScreenAdapter.width(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(XmshopIcons.collect, size: ScreenAdapter.width(60)),
                Text(
                  "收藏",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      color: Colors.black54),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: ScreenAdapter.width(30), right: ScreenAdapter.width(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(XmshopIcons.shopCart, size: ScreenAdapter.width(60)),
                Text(
                  "购物车",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      color: Colors.black54),
                )
              ],
            ),
          ),
          Expanded(
              child: _bottomButton(
                  title: "加入购物车",
                  colors: [Colors.orange.withOpacity(0.5), Colors.orange])),
          Expanded(
              child: _bottomButton(title: "立即购买", colors: [
            Colors.deepOrange.withOpacity(0.7),
            Colors.redAccent
          ]))
        ]));
  }
}
