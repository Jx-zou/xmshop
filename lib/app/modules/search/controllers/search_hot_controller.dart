import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class SearchHotController extends BaseController with StateMixin<List<GoodsModel>>{
  final IGoodsProvider provider;
  SearchHotController({required this.provider});

  @override
  void loadData() async {
    final response = await provider.getGoodsModel(query: {"is_best": "1", "pageSize": "8"});
    if (response.hasError) {
      change(null, status: RxStatus.error());
      return;
    }
    response.body?.map((e) => debugPrint(e.toString()));
    change(response.body, status: RxStatus.success());
  }
}