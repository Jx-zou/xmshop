import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../common/views/rect_inside_swiper_pagination_builder.dart';
import '../controllers/home_swiper_controller.dart';

class HomeSwiperView extends GetView<HomeSwiperController> {
  const HomeSwiperView({super.key});

  Widget _errorImage() {
    return Image.asset("assets/images/404.png", fit: BoxFit.cover);
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Swiper(
              itemCount: state!.length,
              itemBuilder: (context, index) => Image.network(
                  "https://xiaomi.itying.com/${state[index].pic}"
                      .replaceAll('\\', '/'),
                  fit: BoxFit.cover),
              pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: RectInsideSwiperPaginationBuilder()),
              autoplay: true,
              loop: true,
            ),
        onLoading: const Loading(),
        onEmpty: _errorImage(),
        onError: (error) => _errorImage());
  }
}
