import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../utils/https_client.dart';
import '../../../views/pagination/linear_inside_swiper_pagination_builder.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../controllers/home_hot_swiper_controller.dart';

class HomeHotSwiperView extends GetView<HomeHotSwiperController> {
  const HomeHotSwiperView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Swiper(
        itemCount: state!.length,
        itemBuilder: (context, index) => Image.network(
            HttpsClient.picReplaceUrl("${state[index].pic}"),
            fit: BoxFit.fill),
        autoplay: true,
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: LinearInsideSwiperPaginationBuilder(width: 45.0),
        ),
      ),
      onLoading: const LoadingView(),
      onEmpty: const EmptyView(),
      onError: (error) => const ErrorView(),
    );
  }
}
