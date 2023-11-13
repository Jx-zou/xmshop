import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/widgets/round_rect_button.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsBottomView extends GetView {
  const ProductDetailsBottomView({super.key});

  Widget _bottomButton(
          {required String title,
          required List<Color> colors,
          required VoidCallback onPressed}) =>
      Expanded(
          child: RoundRectButton(
              height: ScreenAdapter.height(125),
              margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(ScreenAdapter.height(80)),
              elevation: 0,
              onPressed: onPressed,
              child: Text(title, style: const TextStyle(color: Colors.white))));

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenAdapter.width(15), right: ScreenAdapter.width(10)),
        height: ScreenAdapter.height(160),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: ScreenAdapter.height(3), color: Colors.black12))),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: ScreenAdapter.width(30),
                  right: ScreenAdapter.width(30)),
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
                  left: ScreenAdapter.width(30),
                  right: ScreenAdapter.width(30)),
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
                  left: ScreenAdapter.width(30),
                  right: ScreenAdapter.width(30)),
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
            _bottomButton(
                title: "加入购物车",
                colors: [Colors.orange.withOpacity(0.5), Colors.orange],
                onPressed: () {}),
            _bottomButton(
                title: "立即购买",
                colors: [Colors.deepOrange.withOpacity(0.7), Colors.redAccent],
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
