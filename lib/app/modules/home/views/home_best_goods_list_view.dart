import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../utils/https_client.dart';
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
              itemBuilder: (context, index) => InkWell(
                  onTap: () => Get.toNamed("product-details", parameters: {
                        "requestKey": "id",
                        "requestValue": "${state[index].id}"
                      }),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Container(
                              padding:
                                  EdgeInsets.only(top: ScreenAdapter.width(30)),
                              child: Image.network(
                                HttpsClient.picReplaceUrl("${state[index].pic}"),
                                  fit: BoxFit.cover)),
                          ListTile(
                              title: Text("${state[index].title}"),
                              subtitle: Text(
                                "${state[index].subTitle}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(32),
                                    overflow: TextOverflow.ellipsis),
                              )),
                          ListTile(
                            title: Text("¥${state[index].price}"),
                          )
                        ],
                      ))),
            ),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
