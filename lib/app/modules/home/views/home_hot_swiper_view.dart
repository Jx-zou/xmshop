import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../common/views/status/loading_view.dart';
import '../../../common/views/pagination/rect_inside_swiper_pagination_builder.dart';
import '../../../utils/https_client.dart';
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
          builder: RectInsideSwiperPaginationBuilder(width: 45.0),
        ),
      ),
      onLoading: LoadingView.circle(),
      onEmpty: Container(),
      onError: (error) => Container(),
    );
  }
}
