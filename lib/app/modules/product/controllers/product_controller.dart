import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/data/goods_provider.dart';
import 'package:xmshop/app/models/goods_model.dart';

class ProductController extends GetxController
    with StateMixin<List<GoodsModel>> {
  /*二级导航数据*/
  List subHeaderList = [
    // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    {"id": 1, "title": "综合", "fileds": "all", "sort": -1},
    {"id": 2, "title": "销量", "fileds": 'salecount', "sort": -1},
    {"id": 3, "title": "价格", "fileds": 'price', "sort": -1},
    {"id": 4, "title": "新品优先", "fileds": 'is_new', "sort": -1},
    {"id": 5, "title": "筛选"}
  ];

  int sort = 1;

  Map<String, String> otherQuery = {};

  final IGoodsProvider provider;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxInt selectId = 1.obs;
  int page = 1;
  int pageSize = 10;
  bool isFetching = false;
  final RxBool hasMore = true.obs;

  final ScrollController scrollController = ScrollController();

  ProductController({required this.provider});

  onSubTap(int id) {
    page = 1;
    switchSub(id);
    if (id == 5) {
      scaffoldKey.currentState?.openEndDrawer();
    }
  }

  switchSub(int id) {
    if (id != selectId.value) {
      selectId.value = id;
      sort = 1;
      update();
      if (id == 4) {
        _updateQueryAndRequest(
            newQuery: {"${subHeaderList[id - 1]['fileds']}": "1"});
        return;
      }
    } else {
      sort = -sort;
    }
    if (id == 2 || id == 3) {
      _updateQueryAndRequest(
          newQuery: {"sort": "${subHeaderList[id - 1]['fileds']}_$sort"});
      return;
    }
    otherQuery = {};
    _getGoodsListData();
  }

  _updateHasMore() {
    hasMore.value = !hasMore.value;
    update();
  }

  _addScrollListener() {
    scrollController.addListener(() {
      if (scrollController.offset > scrollController.position.maxScrollExtent - 40 && !isFetching) {
        _updateQueryAndRequest();
      }
    });
  }

  _updateQueryAndRequest({Map<String, String>? newQuery}) {
    if (newQuery != null) {
      otherQuery = newQuery;
      _getGoodsListData(query: newQuery);
      return;
    }
    _getGoodsListData(query: otherQuery);
  }

  _getGoodsListData({Map<String, String>? query}) async {
    //判断是否还有数据，如没有数据了则直接返回
    if (!hasMore.value) {
      return;
    }
    //初始化参数，将请求状态更新为正在请求中
    isFetching = true;
    final Map<String, String> defaultQuery = {
      "cid": Get.arguments['cid'],
      "page": "$page",
      "pageSize": "$pageSize"
    };
    //判断传入的参数是否为空，将其与初始参数整合并发起请求
    if (query != null && query.isNotEmpty) {
      defaultQuery.addAll(query);
    }
    final Response<List<GoodsModel>> response =
        await provider.getGoodsModel(query: defaultQuery);
    //如果请求回应发生错误，更新数据并返回错误信息
    if (response.hasError) {
      change(state, status: RxStatus.error(response.statusText));
      isFetching = false;
      return;
    }
    //如果请求返回的数据为空，则修改更多数据状态，并直接返回
    if (response.body == null || response.body == null || response.body!.isEmpty) {
      _updateHasMore();
      isFetching = false;
      return;
    }
    //如果返回的数据数量小于pageSize，则已经到最后一页
    if (response.body!.length < pageSize) {
      _updateHasMore();
    }
    //如果是第一次发起请求，则更新state数据，并增加page页数
    if (page == 1) {
      change(response.body, status: RxStatus.success());
    }
    //如果不是首次，那么合并旧数据
    if (page > 1) {
      state?.addAll(response.body as List<GoodsModel>);
      change(state, status: RxStatus.success());
    }
    //正常增加数据且不是最后一页，增加页数page
    page++;
    isFetching = false;
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {
      state?.clear();
      page = 1;
      switchSub(selectId.value);
    });
  }

  @override
  void onInit() {
    super.onInit();
    _getGoodsListData();
    _addScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
