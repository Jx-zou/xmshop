import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/web/dynamic_height_web_view.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_more_bar_view.dart';

class ProductDetailsDescriptionView extends GetView<ProductDetailsController> {
  const ProductDetailsDescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Stack(children: [
        Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.height(150)),
            child: DynamicHeightWebView(data: controller.moreSelected.value == 1 ? "${state?.content}" : "${state?.specs}"),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: controller.showBottomMoreBar.isFalse ? const ProductDetailsMoreBarView() : const SizedBox(),
        ),
      ]),
      onLoading: const LoadingView(),
      onError: (error) => const ErrorView(),
    );
  }
}
