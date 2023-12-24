import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../material/rect_inside_swiper_pagination_builder.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../controllers/home_main_swiper_controller.dart';

class HomeMainSwiperView extends GetView<HomeMainSwiperController> {
  const HomeMainSwiperView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.height(682),
      child: controller.obx(
        (state) => Swiper(
          autoplay: true,
          loop: true,
          itemCount: state!.length,
          itemBuilder: (context, index) => Image.network(
              HttpsClient.picReplaceUrl("${state[index].pic}"),
              fit: BoxFit.cover),
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: RectInsideSwiperPaginationBuilder(),
          ),
        ),
        onLoading: LoadingView.circle(),
        onEmpty: const EmptyView(),
        onError: (error) => const ErrorView(),
      ),
    );
  }
}
