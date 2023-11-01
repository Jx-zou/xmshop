import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../common/views/rect_inside_swiper_pagination_builder.dart';
import '../controllers/home_hot_goods_swiper_controller.dart';

class HomeHotGoodsSwiperView
    extends GetView<HomeHotGoodsSwiperController> {
  const HomeHotGoodsSwiperView({super.key});

  _error() => Image.asset("assets/images/404mid.gif", fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Swiper(
        itemCount: state!.length,
        itemBuilder: (context, index) => Image.network(
            "https://xiaomi.itying.com/${state[index].pic}"
                .replaceAll("\\", "/"),
            fit: BoxFit.fill),
        autoplay: true,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: RectInsideSwiperPaginationBuilder(width: 45.0)),
      ),
      onLoading: const Loading(),
      onEmpty: _error(),
      onError: (error) => _error()
    );
  }
}
