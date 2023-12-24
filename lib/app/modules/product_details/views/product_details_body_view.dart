import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/product_details_comment_controller.dart';
import '../controllers/product_details_recommend_controller.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_bottom_view.dart';
import 'product_details_description_view.dart';
import 'product_details_comment_view.dart';
import 'product_details_more_bar_view.dart';
import 'product_details_recommend_view.dart';
import 'product_details_swiper_view.dart';
import 'product_details_switch_view.dart';

class ProductDetailsBodyView extends GetView<ProductDetailsController> {
  final ProductDetailsRecommendController recommendController = Get.find<ProductDetailsRecommendController>();
  final ProductDetailsCommentController commentController = Get.find<ProductDetailsCommentController>();

  ProductDetailsBodyView({super.key});

  Future<void> _onRefresh() async {
    Future.delayed(const Duration(seconds: 3), () {
      controller.onRefresh();
      recommendController.onRefresh();
      commentController.onRefresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RefreshIndicator(
        onRefresh: _onRefresh,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(children: [
            SingleChildScrollView(
              clipBehavior: Clip.antiAlias,
              controller: controller.scrollController,
              child: Column(children: [
                const ProductDetailsSwiperView(),
                ProductDetailsSwitchView(
                  key: controller.tannerTitles[0]['contentKey'],
                ),
                ProductDetailsCommentView(
                  key: controller.tannerTitles[1]['contentKey'],
                ),
                ProductDetailsDescriptionView(
                  key: controller.tannerTitles[2]['contentKey'],
                ),
                ProductDetailsRecommendView(
                  key: controller.tannerTitles[3]['contentKey'],
                ),
              ]),
            ),
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ProductDetailsBottomView(),
            ),
            controller.showBottomMoreBar.isTrue
                ? Positioned(
                    top: ScreenAdapter.height(225),
                    left: 0,
                    right: 0,
                    child: const ProductDetailsMoreBarView(),
                  )
                : const SizedBox()
          ]),
        ),
      ),
    );
  }
}
