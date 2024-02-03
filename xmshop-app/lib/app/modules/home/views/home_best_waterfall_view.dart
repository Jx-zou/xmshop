import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../utils/https_client.dart';
import '../../../utils/routes.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/tile_card.dart';
import '../controllers/home_best_waterfall_controller.dart';

class HomeBestWaterfallView extends GetView<HomeBestWaterfallController> {
  const HomeBestWaterfallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(245, 245, 245, 1),
      padding: EdgeInsets.all(ScreenAdapter.width(30)),
      child: controller.obx(
        (state) => MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: ScreenAdapter.width(26),
          crossAxisSpacing: ScreenAdapter.width(26),
          itemCount: state!.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => TileCard(
            onTap: () {
              Routes.toProductDetails(state[index].id);
            },
            backgroundColor: Colors.white,
            image: Image.network(
                HttpsClient.picReplaceUrl("${state[index].pic}"),
                fit: BoxFit.fitHeight),
            title: "${state[index].title}",
            titleStyle: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
                fontWeight: FontWeight.w600),
            subTitle: "${state[index].subTitle}",
            subTitleStyle: TextStyle(
                fontSize: ScreenAdapter.fontSize(28),
                overflow: TextOverflow.ellipsis),
            trailing: Text(
              "￥${state[index].price}",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
              ),
            ),
          ),
        ),
        onLoading: const LoadingView(),
        onEmpty: const EmptyView(),
        onError: (error) => const ErrorView(),
      ),
    );
  }
}
