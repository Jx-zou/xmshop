import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/status/loading_view.dart';
import '../../../utils/https_client.dart';
import '../../../utils/route_utils.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_hot_list_controller.dart';

class HomeHotListView extends GetView<HomeHotListController> {
  const HomeHotListView({super.key});

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
                          RouteUtils.toGoodsDetails("id", goodsModel.id);
                        },
                        child: Container(
                            color: const Color.fromRGBO(246, 246, 246, 1),
                            child: Row(children: [
                              Expanded(
                                  flex: 3,
                                  child: Column(children: [
                                    SizedBox(
                                        height: ScreenAdapter.height(32)),
                                    Text("${goodsModel.title}",
                                        style: TextStyle(
                                            fontSize:
                                            ScreenAdapter.fontSize(38),
                                            fontWeight: FontWeight.bold)),
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
                                            ScreenAdapter.fontSize(34)))
                                  ])),
                              Expanded(
                                  flex: 2,
                                  child: SizedBox(
                                      height: ScreenAdapter.height(230),
                                      child: Padding(
                                          padding: EdgeInsets.all(
                                              ScreenAdapter.height(20)),
                                          child: Image.network(HttpsClient.picReplaceUrl("${goodsModel.pic}"), fit: BoxFit.cover))))
                            ]))))))
                .toList()),
        onLoading: LoadingView.circle(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
