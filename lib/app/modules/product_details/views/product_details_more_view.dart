import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsMoreView extends GetView<ProductDetailsController> {
  final Widget tar;

  const ProductDetailsMoreView(this.tar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: ScreenAdapter.height(30)),
        width: ScreenAdapter.width(1080),
        child: controller.obx((state) => Stack(
              children: [
                Html(
                    data: controller.moreSelected.value == 1
                        ? "${state?.specs}"
                        : "${state?.content}"),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: controller.showMoreTar.isFalse
                        ? tar
                        : const SizedBox()),
              ],
            )));
  }
}
