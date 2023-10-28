import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/data/goods_provider.dart';
import 'package:xmshop/app/models/goods_model.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';

class HomeBestGoodsListController extends GetxController
    with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;
  final ScrollController scrollController = Get
      .find<HomeController>()
      .scrollController;
  int page = 1;
  int pageSize = 10;
  bool isFetching = false;

  HomeBestGoodsListController({required this.provider});

  _addScrollListener() {
    scrollController.addListener(() {
      if (!isFetching && scrollController.offset >
          scrollController.position.maxScrollExtent - 10) {
        isFetching = true;
        page++;
        if (page > 1) {
          _getGoodsModel();
        }
      }
    });
  }

  _updateState(Response<List<GoodsModel>> response) {
    state?.addAll(response.body as List<GoodsModel>);
  }

  _getGoodsModel() async {
    final response = await provider.getGoodsModel(
        query: {"is_best": "1", "page": "$page", "pageSize": "$pageSize"});
    if (response.hasError) {
      if (page == 1) {
        change(null, status: RxStatus.error(response.statusText));
      } else {
        change(state, status: RxStatus.error(response.statusText));
      }
      isFetching = true;
    } else {
      if (page > 1 && response.body!.isNotEmpty) {
        _updateState(response);
        change(state, status: RxStatus.success());
        if (response.body?.length == pageSize) {
          isFetching = false;
        }
      }
      if(page == 1) {
        change(response.body, status: RxStatus.success());
        isFetching = false;
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
