import 'package:get/get.dart';

import '../base_controller.dart';

abstract class XmPageController<T> extends BaseController with StateMixin<List<T>> {
  late int page;
  late int pageSize;
  late bool isFetching;
  late bool hasMore;
  Map<String, String?> query;

  XmPageController({required this.query, this.pageSize = 10});

  void _initQuery() {
    Map<String, String> defaultQuery = {"page": "$page", "pageSize": "$pageSize"};
    query.addAll(defaultQuery);
  }

  void _updateQuery() {
    query.update("page", (value) => "$page");
    query.update("pageSize", (value) => "$pageSize");
  }

  Future<Response<List<T>>> getData();

  @override
  void loadData() async {
    if (!hasMore || isFetching) {
      return;
    }
    isFetching = true;
    _updateQuery();
    final Response<List<T>> response = await getData();
    if (response.hasError) {
      change(page == 1 ? null : state, status: RxStatus.error());
      hasMore = false;
      return;
    }
    if (response.body == null || response.body!.isEmpty) {
      change(state, status: RxStatus.empty());
      hasMore = false;
      return;
    }
    if (response.body!.length < pageSize) {
      hasMore = false;
    }
    if (page == 1) {
      change(response.body, status: RxStatus.success());
    }
    if (page > 1) {
      state?.addAll(response.body as List<T>);
      change(state, status: RxStatus.success());
    }
    isFetching = false;
  }

  @override
  void init() {
    page = 1;
    pageSize = 10;
    isFetching = false;
    hasMore = true;
    _initQuery();
  }
}