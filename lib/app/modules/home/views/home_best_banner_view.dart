import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/status/loading_view.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_best_banner_controller.dart';

class HomeBestBannerView extends GetView<HomeBestBannerController> {
  const HomeBestBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) => GridView.builder(
            itemCount: state!.length,
            padding: EdgeInsets.only(
                top: ScreenAdapter.height(40),
                bottom: ScreenAdapter.height(20)),
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) => Column(children: [
              SizedBox(
                  height: ScreenAdapter.height(210),
                  child: Image.network(
                      HttpsClient.picReplaceUrl("${state[index].pic}"),
                      fit: BoxFit.cover)),
              SizedBox(height: ScreenAdapter.height(20)),
              Text("¥${state[index].price}",
                  style: TextStyle(fontSize: ScreenAdapter.fontSize(32)))
            ])),
        onLoading: LoadingView.threeBounce(),
        onError: (error) => Container());
  }
}