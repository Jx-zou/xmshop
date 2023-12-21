import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_bottom_view.dart';
import 'product_details_description_view.dart';
import 'product_details_evaluate_view.dart';
import 'product_details_more_tar_view.dart';
import 'product_details_recommended_view.dart';
import 'product_details_switch_view.dart';

class ProductDetailsBodyView extends GetView<ProductDetailsController> {
  const ProductDetailsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  ProductDetailsSwitchView(
                    key: controller.tannerTitles[0]['contentKey'],
                  ),
                  ProductDetailsEvaluateView(
                    key: controller.tannerTitles[1]['contentKey'],
                  ),
                  ProductDetailsDescriptionView(
                    key: controller.tannerTitles[2]['contentKey'],
                  ),
                  ProductDetailsRecommendedView(
                    key: controller.tannerTitles[3]['contentKey'],
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductDetailsBottomView(),
            ),
            controller.showMoreTar.isTrue
                ? Positioned(
                    top: ScreenAdapter.height(225),
                    left: 0,
                    right: 0,
                    child: const ProductDetailsMoreTarView(),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
