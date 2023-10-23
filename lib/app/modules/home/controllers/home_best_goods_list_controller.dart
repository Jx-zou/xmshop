import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/data/goods_provider.dart';
import 'package:xmshop/app/models/goods_model.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeBestGoodsListController extends GetxController
    with StateMixin<GoodsModel> {
  final IGoodsProvider provider;
  final ScrollController scrollController = Get
      .find<HomeController>()
      .scrollController;
  int page = 1;
  int pageSize = 10;
  bool flag = false;

  HomeBestGoodsListController({required this.provider});

  _addScrollListener() {
    scrollController.addListener(() {
      if (!flag && scrollController.offset >
          scrollController.position.maxScrollExtent - 10) {
        flag = true;
        page++;
        if (page > 1) {
          _getGoodsModel();
        }
      }
    });
  }

  _updateState(Response<GoodsModel> response) {
    state?.items?.addAll(response.body?.items as Iterable<GoodsItemModel>);
  }

  _getGoodsModel() async {
    final response = await provider.getGoodsModel(
        query: {"is_best": "1", "page": page.toString(), "pageSize": pageSize.toString()});
    if (response.hasError) {
      if (page == 1) {
        change(null, status: RxStatus.error(response.statusText));
      } else {
        change(state, status: RxStatus.error(response.statusText));
      }
      flag = true;
    } else {
      if (page > 1 && response.body!.items!.isNotEmpty) {
        _updateState(response);
        change(state, status: RxStatus.success());
        if (response.body?.items?.length == pageSize) {
          flag = false;
        }
      }
      if(page == 1) {
        change(response.body, status: RxStatus.success());
        flag = false;
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _getGoodsModel();
    _addScrollListener();
  }
}
