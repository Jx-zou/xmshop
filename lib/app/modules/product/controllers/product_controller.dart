import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class ProductController extends GetxController
    with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;
  ProductController({required this.provider});

  /*二级导航数据*/
  final List subHeaderList = [
    // 排序     升序：price_1     {price:1}        降序：price_-1   {price:-1}
    {
      "id": 1,
      "title": "综合",
      "fileds": "all",
      "sort": false,
      "is_drawer": false
    },
    {
      "id": 2,
      "title": "销量",
      "fileds": 'salecount',
      "sort": true,
      "is_drawer": false
    },
    {
      "id": 3,
      "title": "价格",
      "fileds": 'price',
      "sort": true,
      "is_drawer": false
    },
    {
      "id": 4,
      "title": "新品优先",
      "fileds": 'is_new',
      "sort": false,
      "is_drawer": false
    },
    {"id": 5, "title": "筛选", "is_drawer": true}
  ];

  int sort = 1;
  Map<String, String> coreQuery = {};
  Map<String, String> screenQuery = {};
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxInt selectId = 1.obs;
  int page = 1;
  int pageSize = 10;
  bool isFetching = false;
  final RxBool hasMore = true.obs;
  final ScrollController scrollController = ScrollController();

  onSubTap(int id) {
    _getScreenData(id);
  }

  _getScreenData(int id) {
    page = 1;
    hasMore.value = true;
    update();
    Map<String, dynamic> map = subHeaderList[id - 1];
    if (map['sort'] == true) {
      sort = -sort;
      if (id != selectId.value) {
        sort = 1;
      }
      _updateScreenQueryAndRequest('sort', () => "${map['fileds']}_$sort");
      return;
    }
    if (map['is_drawer'] == true) {
      _endDrawerSubTap();
      return;
    }
    _updateScreenQueryAndRequest(map['fileds'], () => "1");
  }

  _updateScreenQueryAndRequest(String key, String Function() ifAbsent) {
    if (screenQuery.isNotEmpty) {
      screenQuery.clear();
    }
    screenQuery.putIfAbsent(key, ifAbsent);
    _getGoodsListData();
  }

  _endDrawerSubTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  _addScrollListener() {
    scrollController.addListener(() {
      if (!isFetching &&
          scrollController.offset >
              scrollController.position.maxScrollExtent - 40) {
        _getGoodsListData();
      }
    });
  }

  _initQuery() {
    coreQuery = {
      "page": "$page",
      "pageSize": "$pageSize",
      "${Get.parameters['requestKey']}": "${Get.parameters['requestValue']}"
    };
  }

  _getGoodsListData() async {
    //判断是否还有数据，如没有数据了则直接返回
    if (!hasMore.value) {
      return;
    }
    //初始化参数，将请求状态更新为正在请求中
    isFetching = true;
    coreQuery.update("page", (value) => "$page");
    screenQuery.addAll(coreQuery);
    //发起请求，并接受返回数据
    final Response response = await provider.getGoodsModel(query: screenQuery);
    //如果请求回应发生错误，更新数据并返回错误信息
    if (response.hasError) {
      change(state, status: RxStatus.error(response.statusText));
      isFetching = false;
      return;
    }
    //如果请求返回的数据为空，则修改更多数据状态，并直接返回
    if (response.body == null || response.body!.isEmpty) {
      hasMore.value = false;
      isFetching = false;
      update();
      return;
    }
    //如果返回的数据数量小于pageSize，则已经到最后一页
    if (response.body!.length < pageSize) {
      hasMore.value = false;
      update();
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
    await Future.delayed(const Duration(milliseconds: 1000), () {
      page = 1;
      _getGoodsListData();
    });
  }

  @override
  void onInit() {
    super.onInit();
    _initQuery();
    _getScreenData(selectId.value);
    _addScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
