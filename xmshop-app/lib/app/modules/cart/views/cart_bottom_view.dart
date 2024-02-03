import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/check_box/image_check_box.dart';
import '../../../views/decimal.dart';
import '../controllers/cart_controller.dart';

class CartBottomView extends GetView<CartController> {
  const CartBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(190),
      padding: EdgeInsets.all(ScreenAdapter.width(30)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
              color: Colors.black.withOpacity(0.02),
              width: ScreenAdapter.height(2)),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Obx(
            () => ImageCheckBox(
              value: controller.allSelected.value,
              onChanged: (isChecked) {
                controller.changeAllSelected();
              },
              activeWidget: Image.asset(
                "assets/images/cart_checkbox_select_icon.png",
                width: ScreenAdapter.fontSize(56),
                height: ScreenAdapter.fontSize(56),
              ),
              unActiveWidget: Image.asset(
                "assets/images/cart_checkbox_unselect_icon.png",
                width: ScreenAdapter.fontSize(56),
                height: ScreenAdapter.fontSize(56),
              ),
            ),
          ),
          SizedBox(width: ScreenAdapter.width(25)),
          Text(
            "全选",
            style: TextStyle(
              color: Colors.black87,
              fontSize: ScreenAdapter.fontSize(42),
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        Row(children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    "合计",
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(38),
                    ),
                  ),
                  Text(
                    "(不含运费):",
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                      color: Colors.black38,
                    ),
                  ),
                  Row(children: [
                    Text(
                      "￥",
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(32),
                        color: Colors.deepOrange,
                      ),
                    ),
                    Obx(
                      () => Decimal(
                        controller.totalPrice.value,
                        height: ScreenAdapter.height(61),
                        crossAxisAlignment: CrossAxisAlignment.end,
                        intStyle: TextStyle(
                          fontSize: ScreenAdapter.fontSize(46),
                          color: Colors.deepOrange,
                        ),
                        fractionStyle: TextStyle(
                          fontSize: ScreenAdapter.fontSize(28),
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ]),
                ]),
                Row(children: [
                  const Text("免运费", style: TextStyle(color: Colors.black38)),
                  SizedBox(width: ScreenAdapter.width(10)),
                  const Text("优惠:￥0.01",
                      style: TextStyle(color: Colors.black54)),
                  SizedBox(width: ScreenAdapter.width(10)),
                  InkResponse(
                    onTap: () {},
                    child: Row(children: [
                      const Text("明细",
                          style: TextStyle(color: Colors.deepOrange)),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: ScreenAdapter.fontSize(32),
                        color: Colors.deepOrange,
                      ),
                    ]),
                  ),
                ]),
              ]),
          SizedBox(width: ScreenAdapter.width(15)),
          Obx(
            () => GradientButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.width(54),
                vertical: ScreenAdapter.height(20),
              ),
              borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
              gradient: LinearGradient(colors: [
                Colors.deepOrange.withOpacity(0.7),
                Colors.deepOrange
              ]),
              child: Text(
                "结算${controller.total.value}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(48), color: Colors.white),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
