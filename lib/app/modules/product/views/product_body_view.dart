import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/product_controller.dart';
import 'product_sub_bar_view.dart';
import 'product_waterfall_view.dart';

class ProductBodyView extends GetView<ProductController> {
  const ProductBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.onRefresh(),
      child: Stack(children: [
        Positioned(
          top: ScreenAdapter.height(120),
          left: 0,
          right: 0,
          bottom: 0,
          child: const ProductWaterfallView(),
        ),
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: ProductSubBarView(),
        )
      ]),
    );
  }
}
