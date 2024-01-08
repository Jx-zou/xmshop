import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_shop_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/button/label_button.dart';
import '../../../views/close_bottom_sheet.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBottomView extends GetView<ProductDetailsController> {
  const ProductDetailsBottomView({super.key});

  void _changeAttr(VoidCallback onPressed) {
    Get.bottomSheet(
      CloseBottomSheet(
        height: ScreenAdapter.getScreenHeight() * 3 / 4,
        icon: XmShopIcons.close,
        closed: () {
          Get.back();
        },
        bottom: GradientButton(
          width: ScreenAdapter.width(800),
          padding: EdgeInsets.all(ScreenAdapter.width(40)),
          gradient: LinearGradient(colors: [Colors.deepOrange.withOpacity(0.5), Colors.redAccent]),
          borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
          onPressed: onPressed,
          child: Text(
            "确定",
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(32),
            ),
          ),
        ),
        child: Container(),
      ),
      isScrollControlled: true
    );
  }

  Widget _bottomButton(String title, List<Color> colors, VoidCallback onPressed) {
    return GradientButton(
      height: ScreenAdapter.height(125),
      margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
      gradient: LinearGradient(colors: colors),
      borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
      onPressed: () {
        _changeAttr(onPressed);
      },
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: ScreenAdapter.width(15),
        right: ScreenAdapter.width(10),
      ),
      height: ScreenAdapter.height(160),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: ScreenAdapter.height(3),
            color: Colors.black.withOpacity(0.02),
          ),
        ),
      ),
      child: Row(children: [
        LabelButton(
          onPressed: () {},
          margin: EdgeInsets.only(
            left: ScreenAdapter.width(30),
            right: ScreenAdapter.width(25),
          ),
          widget: Icon(
            XmShopIcons.online,
            size: ScreenAdapter.fontSize(56),
          ),
          label: "客服",
          style: TextStyle(
            fontSize: ScreenAdapter.fontSize(28),
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        LabelButton(
          onPressed: () {},
          margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(25)),
          widget: Icon(XmShopIcons.collect, size: ScreenAdapter.fontSize(56)),
          label: "收藏",
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(28),
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6)),
        ),
        LabelButton(
          onPressed: () {},
          margin: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(25)),
          widget: Icon(XmShopIcons.shopCart, size: ScreenAdapter.fontSize(56)),
          label: "购物车",
          style: TextStyle(
              fontSize: ScreenAdapter.fontSize(28),
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6)),
        ),
        Expanded(
          child: _bottomButton(
            "加入购物车",
            [Colors.orange.withOpacity(0.5), Colors.orange],
            controller.addCart,
          ),
        ),
        Expanded(
          child: _bottomButton(
            "立即购买",
            [Colors.deepOrange.withOpacity(0.7), Colors.redAccent],
            controller.buy,
          ),
        ),
      ]),
    );
  }
}
