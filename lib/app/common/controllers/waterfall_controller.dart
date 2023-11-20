
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class WaterfallController<T> extends BaseController with StateMixin<List<T>> {
  final ScrollController scrollController;
  late int page;
  late int pageSize;
  late bool isFetching;
  final int offset;
  Map<String, String>? query;

  WaterfallController(this.scrollController, {this.offset = 10, this.query});

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

  void _initQuery() {
    Map<String, String> defaultQuery = {"page": "$page", "pageSize": "$pageSize"};
    if (query == null) {
      query = defaultQuery;
      return;
    }
    query?.addAll(defaultQuery);
  }

  void _updateQuery() {
    query?.update("page", (value) => "$page");
    query?.update("pageSize", (value) => "$pageSize");
  }

  Future<Response<List<T>>> getData();

  @override
  void loadData() async {
    _updateQuery();
    final response = await getData();
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
      state?.addAll(response.body as List<T>);
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
    _initQuery();
    _addScrollListener();
  }
}