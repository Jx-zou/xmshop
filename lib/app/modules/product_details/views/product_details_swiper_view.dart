import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/pagination/rect_fraction_pagination_builder.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsSwiperView extends GetView<ProductDetailsController> {
  const ProductDetailsSwiperView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(1200),
        child: Swiper(
          itemCount: 3,
          itemBuilder: (context, index) => Image.network(
              HttpsClient.picReplaceUrl("${state?.pic}"),
              fit: BoxFit.cover),
          pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: RectFractionPaginationBuilder(
              backgroundColor: Colors.black26,
              borderRadius: BorderRadius.circular(
                ScreenAdapter.height(10),
              ),
              color: Colors.white,
              activeColor: Colors.cyan,
              width: ScreenAdapter.width(100),
              height: ScreenAdapter.height(60),
              fontSize: ScreenAdapter.fontSize(28),
              activeFontSize: ScreenAdapter.fontSize(28),
            ),
          ),
        ),
      ),
    );
  }
}
