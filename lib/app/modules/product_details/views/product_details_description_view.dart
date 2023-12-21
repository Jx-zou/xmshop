import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_more_tar_view.dart';

class ProductDetailsDescriptionView extends GetView<ProductDetailsController> {
  const ProductDetailsDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: ScreenAdapter.height(30),
      ),
      width: ScreenAdapter.width(1080),
      child: controller.obx(
        (state) => Stack(children: [
          Html(
            data: controller.moreSelected.value == 1
                ? "${state?.specs}"
                : "${state?.content}",
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: controller.showMoreTar.isFalse
                ? const ProductDetailsMoreTarView()
                : const SizedBox(),
          ),
        ]),
      ),
    );
  }
}
