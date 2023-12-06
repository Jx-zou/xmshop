import 'package:flutter/material.dart';

import 'paging_controller.dart';

abstract class ScrollPageController<T> extends PagingController<T> {
  final ScrollController scrollController;
  final int offset;

  ScrollPageController({required this.scrollController, this.offset = 20, super.query});

  void _addScrollListener() {
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