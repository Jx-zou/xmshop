import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../common/utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_more_bar_view.dart';

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
          WebViewWidget(controller: controller.htmlController),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: controller.showBottomMoreBar.isFalse
                ? const ProductDetailsMoreBarView()
                : const SizedBox(),
          ),
        ]),
        onLoading: LoadingView.circle(),
        onError: (error) => const ErrorView(),
      ),
    );
  }
}
