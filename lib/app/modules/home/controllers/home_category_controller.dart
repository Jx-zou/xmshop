import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/best_category_provider.dart';
import '../../../models/best_category_model.dart';

class HomeCategoryController extends GetxController with StateMixin<List<BestCategoryModel>> {
  final IBestCategoryProvider provider;
  HomeCategoryController({required this.provider});
  final RxDouble paginationValue = RxDouble(0);
  final ScrollController scrollController = ScrollController();

  _getBestCategoryData() async {
    final response = await provider.getBestCategoryModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset > 0 && scrollController.position.maxScrollExtent > 0) {
        paginationValue.value = scrollController.offset / scrollController.position.maxScrollExtent;
        update();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _getBestCategoryData();
    _addScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}