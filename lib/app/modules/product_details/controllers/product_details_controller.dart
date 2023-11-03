import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/icons/xmshop_icons.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

import '../../../data/goods_details_provider.dart';
import '../../../models/goods_details_model.dart';

class ProductDetailsController extends GetxController
    with StateMixin<GoodsDetailsModel> {
  final IGoodsDetailsProvider provider;

  ProductDetailsController(this.provider);

  Map<String, String> query = {};

  final ScrollController scrollController = ScrollController();
  final List<Map<String, dynamic>> tarTitles = [
    {"id": 1, "title": "商品"},
    {"id": 2, "title": "评价"},
    {"id": 3, "title": "详情"},
    {"id": 4, "title": "推荐"}
  ];

  final List moreMenu = [
    {"id": 1, "title": "首页", "icon": XmshopIcons.home},
    {"id": 2, "title": "消息", "icon": XmshopIcons.message},
    {"id": 3, "title": "收藏", "icon": XmshopIcons.collect}
  ];

  final RxDouble appBarOpacity = 0.0.obs;
  final Rx<Color> actionColor = Colors.white.obs;
  final RxInt selectedId = 1.obs;
  final RxBool showTabs = false.obs;

  _changeSelectedId(int id) {
    selectedId.value = id;
    update();
  }

  onTarTitlePressed(int id) {
    _changeSelectedId(id);
    scrollController.animateTo(tarTitles[id - 1]['anchor_point'],
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  _addScrollListener() {
    scrollController.addListener(() {
      double offset = scrollController.offset;
      if (offset <= 75) {
        appBarOpacity.value = offset / 75;
        actionColor.value = Colors.white;
        showTabs.value = false;
        update();
      } else {
        showTabs.value = true;
        actionColor.value = Colors.black;
        update();
      }
      for (int i = 0; i < tarTitles.length; i++) {
        double current = tarTitles[i]['anchor_point'];
        if (i < tarTitles.length - 1) {
          double next = tarTitles[i + 1]['anchor_point'];
          if (current < offset && offset < next) {
            _changeSelectedId(i + 1);
            return;
          }
        } else if (offset > current) {
          _changeSelectedId(i + 1);
          return;
        }
      }
    });
  }

  _getGoodsDetails() async {
    final response = await provider.getGoodsDetailsModel(query: query);
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  _initAnchorPoint() {
    for (Map map in tarTitles) {
      GlobalKey contentKey = map['contentKey'] as GlobalKey;
      BuildContext? context = contentKey.currentContext;
      if (context != null) {
        RenderObject? renderObject = context.findRenderObject();
        if (renderObject != null) {
          RenderBox renderBox = renderObject as RenderBox;
          Offset offset = renderBox.localToGlobal(Offset.zero);
          map.putIfAbsent(
              "anchor_point",
              () =>
                  offset.dy +
                  scrollController.offset -
                  ScreenAdapter.height(225));
        }
      }
    }
  }

  _initGlobalKey() {
    for (Map map in tarTitles) {
      map.putIfAbsent("contentKey", () => GlobalKey());
    }
  }

  _initQuery() {
    query = {
      "${Get.parameters['requestKey']}": "${Get.parameters['requestValue']}"
    };
  }

  @override
  void onInit() {
    super.onInit();
    _initQuery();
    _initGlobalKey();
    _addScrollListener();
    _getGoodsDetails();
  }

  @override
  void onReady() {
    super.onReady();
    _initAnchorPoint();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
