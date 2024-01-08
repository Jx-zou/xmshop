import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/page/scroll_page_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class ProductController extends ScrollPageController<GoodsModel> {
  final IGoodsProvider provider;
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
  Map<String, String?> screenQuery = {};
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final RxInt selectId = 1.obs;

  ProductController({required this.provider}) : super(scrollController: ScrollController(), query: Get.parameters);

  onSubBannerTap(int selectId) {
    this.selectId.value = selectId;
    _getScreenData(selectId);
  }

  _getScreenData(int selectId) {
    page = 1;
    hasMore = true;
    update();
    Map<String, dynamic> map = subHeaderList[selectId - 1];
    if (map['sort'] == true) {
      sort = -sort;
      if (selectId != this.selectId.value) {
        sort = 1;
      }
      _updateScreenQueryAndRequest('sort', () => "${map["fileds"]}_$sort");
      return;
    }
    if (map['is_drawer'] != true) {
      _updateScreenQueryAndRequest(map['fileds'], () => "1");
      return;
    }
    _endDrawerSubTap();
  }

  _updateScreenQueryAndRequest(String key, String Function() ifAbsent) {
    if (screenQuery.isNotEmpty) {
      screenQuery.clear();
    }
    screenQuery.putIfAbsent(key, ifAbsent);
    loadData();
  }

  _endDrawerSubTap() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  void init() {
    super.init();
    _getScreenData(selectId.value);
  }

  @override
  Future<Response<List<GoodsModel>>> getData() {
    screenQuery.addAll(super.query);
    return provider.getGoodsModel(query: screenQuery);
  }
}
