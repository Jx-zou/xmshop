import 'package:flutter/material.dart';

import 'page_controller.dart';

abstract class ScrollPageController<T> extends XmPageController<T> {
  final ScrollController scrollController;
  final int offset;

  ScrollPageController({required this.scrollController, this.offset = 100, required super.query});

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