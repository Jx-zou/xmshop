import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/home_hot_goods_list_controller.dart';

class HomeHotGoodsListView extends GetView<HomeHotGoodsListController> {
  const HomeHotGoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      List<Widget> widgets = [];
      for (int i = 0; i < state!.length; i++) {
        widgets.add(Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenAdapter.height(10),
                  bottom: ScreenAdapter.height(10)),
              child: InkWell(
                  onTap: () => Get.toNamed("product-details", parameters: {
                        "requestKey": "id",
                        "requestValue": "${state[i].id}"
                      }),
                  child: Container(
                    color: const Color.fromRGBO(246, 246, 246, 1),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                SizedBox(height: ScreenAdapter.height(32)),
                                Text(
                                  "${state[i].title}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: ScreenAdapter.height(20)),
                                Text("${state[i].subTitle}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(28))),
                                SizedBox(height: ScreenAdapter.height(20)),
                                Text("${state[i].price}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34)))
                              ],
                            )),
                        Expanded(
                            flex: 2,
                            child: SizedBox(
                                height: ScreenAdapter.height(230),
                                child: Padding(
                                    padding: EdgeInsets.all(
                                        ScreenAdapter.height(20)),
                                    child: Image.network(
                                        "https://xiaomi.itying.com/${state[i].pic}"
                                            .replaceAll("\\", "/"),
                                        fit: BoxFit.cover))))
                      ],
                    ),
                  )),
            )));
      }
      return Column(children: widgets);
    });
  }
}
