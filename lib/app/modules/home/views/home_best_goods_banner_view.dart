import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/loading.dart';
import 'package:xmshop/app/modules/home/controllers/home_best_goods_banner_controller.dart';

import '../../../utils/screen_adapter.dart';

class HomeBestGoodsBannerView extends GetView<HomeBestGoodsBannerController> {
  const HomeBestGoodsBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => GridView.builder(
          itemCount: state!.length,
          padding: EdgeInsets.only(top: ScreenAdapter.height(40), bottom: ScreenAdapter.height(20)),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                      height: ScreenAdapter.height(210),
                      child: Image.network(
                          "https://xiaomi.itying.com/${state[index].pic}"
                              .replaceAll("\\", "/"),
                          fit: BoxFit.cover)),
                  SizedBox(height: ScreenAdapter.height(20)),
                  Text("¥${state[index].price}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(32)))
                ],
              )),
    onLoading: const Loading(),
    onError: (error) => Container());
  }
}
