import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/routes.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../models/goods_model.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../controllers/home_hot_list_controller.dart';

class HomeHotListView extends GetView<HomeHotListController> {
  const HomeHotListView({super.key});

  Widget _module(GoodsModel goodsModel) {
    return InkWell(
      onTap: () {
        Routes.toProductDetails(goodsModel.id);
      },
      child: Container(
        color: const Color.fromRGBO(246, 246, 246, 1),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Column(children: [
              SizedBox(
                height: ScreenAdapter.height(32),
              ),
              Text(
                "${goodsModel.title}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(38),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
              Text(
                "${goodsModel.subTitle}",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(28),
                ),
              ),
              SizedBox(
                height: ScreenAdapter.height(20),
              ),
              Text(
                "${goodsModel.price}",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(34),
                ),
              )
            ]),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: ScreenAdapter.height(230),
              child: Padding(
                padding: EdgeInsets.all(
                  ScreenAdapter.height(20),
                ),
                child: Image.network(
                  HttpsClient.picReplaceUrl("${goodsModel.pic}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList() {
      List<Widget> list = [];
      for (int i = 0; i < controller.state!.length; i++) {
        list.add(
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: i == 0 ? 0.0 : ScreenAdapter.height(20),
              ),
              child: _module(controller.state![i]),
            ),
          ),
        );
      }
      return list;
    }

    return controller.obx(
      (state) => Column(children: widgetList()),
      onLoading: LoadingView.circle(),
      onEmpty: const EmptyView(),
      onError: (error) => const ErrorView(),
    );
  }
}
