import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../data/best_category_provider.dart';
import '../../../models/best_category_model.dart';

class HomeCategoryController extends BaseController with StateMixin<List<BestCategoryModel>> {
  final IBestCategoryProvider provider;

  HomeCategoryController({required this.provider});

  final RxDouble paginationValue = 0.0.obs;
  final ScrollController scrollController = ScrollController();

  _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset > 0 && scrollController.position.maxScrollExtent > 0) {
        paginationValue.value = scrollController.offset / scrollController.position.maxScrollExtent;
        update();
      }
    });
  }

  @override
  void loadData() async {
    final Response<List<BestCategoryModel>> response = await provider.getBestCategoryModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else if (response.body!.isEmpty) {
      change(response.body, status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  @override
  void init() {
    _addScrollListener();
  }

  @override
  void close() {
    scrollController.dispose();
  }
}
