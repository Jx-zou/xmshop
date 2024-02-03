import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'xm_page_controller.dart';

abstract class ScrollPageController<T> extends XmPageController<T> {
  final ScrollController scrollController;
  final double? offset;

  ScrollPageController({required this.scrollController, this.offset, required super.query});

  void _addScrollListener() {
    final offset = this.offset ?? Get.height / 2;
    scrollController.addListener(() {
      if (!isFetching && scrollController.offset > scrollController.position.maxScrollExtent - offset) {
        isFetching = true;
        page++;
        if (page > 1) {
          loadData();
        }
      }
    });
  }

  @override
  void init() {
    super.init();
    _addScrollListener();
  }

  @override
  void close() {
    super.close();
    scrollController.dispose();
  }
}