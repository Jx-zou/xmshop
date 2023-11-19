import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/views/widgets/title_banner.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsRecommendedView extends GetView<ProductDetailsController> {
  const ProductDetailsRecommendedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBanner("猜你喜欢", leftSize: ScreenAdapter.fontSize(48)),

      ]
    );
  }
}
