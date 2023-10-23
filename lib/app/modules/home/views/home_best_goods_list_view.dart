import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/loading.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

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
              itemCount: state!.items!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                          padding:
                              EdgeInsets.only(top: ScreenAdapter.width(30)),
                          child: Image.network(
                              "https://xiaomi.itying.com/${state.items?[index].pic}"
                                  .replaceAll("\\", "/"),
                              fit: BoxFit.cover,
                              errorBuilder: (c, o, s) => Image.asset(
                                  "assets/images/404mix.jpg",
                                  fit: BoxFit.cover))),
                      ListTile(
                          title: Text("${state.items?[index].title}"),
                          subtitle: Text(
                            "${state.items?[index].subTitle}",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                overflow: TextOverflow.ellipsis),
                          )),
                      ListTile(
                        title: Text("¥${state.items?[index].price}"),
                      )
                    ],
                  )),
            ),
        onLoading: const Loading(),
        onError: (error) => Container());
  }
}
