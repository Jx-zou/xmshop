import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsMoreBarView extends GetView<ProductDetailsController> {
  const ProductDetailsMoreBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenAdapter.height(150),
      child: Obx(
        () => Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              controller.changeMoreSelected(1);
            },
            child: Text(
              "商品介绍",
              style: TextStyle(
                  color: controller.moreSelected.value == 1
                      ? Colors.redAccent
                      : null),
            ),
          ),
          InkWell(
            onTap: () {
              controller.changeMoreSelected(2);
            },
            child: Text(
              "规格参数",
              style: TextStyle(
                  color: controller.moreSelected.value == 2
                      ? Colors.redAccent
                      : null),
            ),
          ),
        ]),
      ),
    );
  }
}
