import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/home/controllers/home_hot_goods_list_controller.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

class HomeHotGoodsListView extends GetView<HomeHotGoodsListController> {
  const HomeHotGoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      List<Widget> widgets = [];
      for (int i = 0; i < state!.items!.length; i++) {
        widgets.add(Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenAdapter.height(10),
                  bottom: ScreenAdapter.height(10)),
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
                              "${state.items![i].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(38),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: ScreenAdapter.height(20)),
                            Text("${state.items![i].subTitle}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(28))),
                            SizedBox(height: ScreenAdapter.height(20)),
                            Text("${state.items![i].price}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(34)))
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                            height: ScreenAdapter.height(230),
                            child: Padding(
                                padding: EdgeInsets.all(ScreenAdapter.height(20)),
                                child: Image.network(
                                    "https://xiaomi.itying.com/${state.items![i].pic}".replaceAll("\\", "/"),
                                    fit: BoxFit.cover))))
                  ],
                ),
              ),
            )));
      }
      return Column(children: widgets);
    });
  }
}
