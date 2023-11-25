import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/views/widgets/tile_card.dart';
import '../../../common/views/loading.dart';
import '../../../utils/https_client.dart';
import '../../../utils/route_utils.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_best_goods_list_controller.dart';

class HomeBestGoodsListView extends GetView<HomeBestGoodsListController> {
  const HomeBestGoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: ScreenAdapter.width(26),
            crossAxisSpacing: ScreenAdapter.width(26),
            itemCount: state!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => TileCard(
                onTap: () {
                  RouteUtils.toGoodsDetails("id", state[index].id);
                },
                backgroundColor: Colors.white,
                image: Image.network(
                  HttpsClient.picReplaceUrl("${state[index].pic}"),
                  fit: BoxFit.fitHeight,
                ),
                title: "${state[index].title}",
                titleStyle: TextStyle(
                    fontSize: ScreenAdapter.fontSize(42),
                    fontWeight: FontWeight.w600),
                subTitle: "${state[index].subTitle}",
                subTitleStyle: TextStyle(
                    fontSize: ScreenAdapter.fontSize(28),
                    overflow: TextOverflow.ellipsis),
                trailing: Text("￥${state[index].price}",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(42))))),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
