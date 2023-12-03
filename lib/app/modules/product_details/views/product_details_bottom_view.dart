import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/label_icon_button.dart';
import '../../../utils/bottom_sheet_utils.dart';
import '../../../utils/screen_adapter.dart';
import '../../../widgets/bottom_button.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBottomView extends GetView<ProductDetailsController> {
  const ProductDetailsBottomView({super.key});

  Widget _bottomButton({required String title, required List<Color> colors, required VoidCallback onPressed}) {
    return BottomButton(
        margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
        title: title,
        colors: colors,
        onPressed: () {
          BottomSheetUtils.goodsSelectedBottomSheet(onPressed: onPressed);
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
          LabelIconButton(
              onTap: () {},
              margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
              icon: Icon(XmshopIcons.online, size: ScreenAdapter.width(60)),
              label: "客服",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(28), color: Colors.black54)),
          LabelIconButton(
              onTap: () {},
              margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
              icon: Icon(XmshopIcons.collect, size: ScreenAdapter.width(58)),
              label: "收藏",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(28), color: Colors.black54)),
          LabelIconButton(
              onTap: () {},
              margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(10)),
              icon: Icon(XmshopIcons.shopCart, size: ScreenAdapter.width(60)),
              label: "购物车",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(28), color: Colors.black54)),
          Expanded(
              child: _bottomButton(
                  title: "加入购物车",
                  colors: [Colors.orange.withOpacity(0.5), Colors.orange],
                  onPressed: () {
                    controller.addCart();
                  })),
          Expanded(
              child: _bottomButton(
                  title: "立即购买",
                  colors: [
                    Colors.deepOrange.withOpacity(0.7),
                    Colors.redAccent
                  ],
                  onPressed: () {
                    controller.buy();
                  }))
        ]));
  }
}