import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';
import 'home_controller.dart';

class HomeBestGoodsListController extends BaseController with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;
  final ScrollController scrollController = Get.find<HomeController>().scrollController;
  late int page;
  late int pageSize;
  late bool isFetching;

  HomeBestGoodsListController({required this.provider});

  _addScrollListener() {
    scrollController.addListener(() {
      if (!isFetching && scrollController.offset > scrollController.position.maxScrollExtent - 10) {
        isFetching = true;
        page++;
        if (page > 1) {
          loadData();
        }
      }
    });
  }

  @override
  void loadData() async {
    final response = await provider.getGoodsModel(query: {"is_best": "1", "page": "$page", "pageSize": "$pageSize"});
    if (response.hasError) {
      change(page == 1 ? null : state, status: RxStatus.error(response.statusText));
      isFetching = true;
      return;
    }
    if (page == 1) {
      change(response.body, status: RxStatus.success());
      isFetching = false;
      return;
    }
    if (page > 1 && response.body!.isNotEmpty) {
      state?.addAll(response.body as List<GoodsModel>);
      change(state, status: RxStatus.success());
      if (response.body?.length == pageSize) {
        isFetching = false;
      }
    }
  }

  @override
  void init() {
    page = 1;
    pageSize = 10;
    isFetching = false;
    _addScrollListener();
  }
}
