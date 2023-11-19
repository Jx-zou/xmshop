import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_hot_goods_list_controller.dart';
import '../../../common/views/loading.dart';
import '../../../utils/screen_adapter.dart';

class HomeHotGoodsListView extends GetView<HomeHotGoodsListController> {
  const HomeHotGoodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Column(
            children: state!
                .map((goodsModel) => Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: ScreenAdapter.height(10),
                            bottom: ScreenAdapter.height(10)),
                        child: InkWell(
                            onTap: () {
                              controller.onToDetails(goodsModel.id);
                            },
                            child: Container(
                                color: const Color.fromRGBO(246, 246, 246, 1),
                                child: Row(children: [
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                              height: ScreenAdapter.height(32)),
                                          Text(
                                            "${goodsModel.title}",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenAdapter.fontSize(38),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                              height: ScreenAdapter.height(20)),
                                          Text("${goodsModel.subTitle}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          28))),
                                          SizedBox(
                                              height: ScreenAdapter.height(20)),
                                          Text("${goodsModel.price}",
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                          34)))
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
                                                  "https://xiaomi.itying.com/${goodsModel.pic}"
                                                      .replaceAll("\\", "/"),
                                                  fit: BoxFit.cover))))
                                ]))))))
                .toList()),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
