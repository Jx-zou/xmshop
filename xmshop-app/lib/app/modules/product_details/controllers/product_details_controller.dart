import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controllers/scroll_gradient_controller.dart';
import '../../../utils/screen_adapter.dart';
import '../../../data/goods_details_provider.dart';
import '../../../models/goods_details_model.dart';
import '../../../icons/xm_icons.dart';
import '../../../services/cart_service.dart';
import 'product_details_comment_controller.dart';
import 'product_details_recommend_controller.dart';

class ProductDetailsController extends ScrollGradientController with StateMixin<GoodsDetailsModel> {
  final IGoodsDetailsProvider provider;
  ProductDetailsController({required this.provider}) : super(scrollController: ScrollController());
  final CartService cartService = Get.find<CartService>();
  final Map<String, String>? selectedAttr = {};
  late final Map<String, String?> query;
  final RxBool showBottomMoreBar = false.obs;
  final RxInt shopNum = 1.obs;
  final RxInt selectedId = 1.obs;
  final RxInt moreSelected = 1.obs;

  final List<Map<String, dynamic>> tannerTitles = [
    {"id": 1, "contentKey": "", "title": "商品", "anchor_point": 0.0},
    {"id": 2, "contentKey": "", "title": "评价", "anchor_point": 0.0},
    {"id": 3, "contentKey": "", "title": "详情", "anchor_point": 0.0},
    {"id": 4, "contentKey": "", "title": "推荐", "anchor_point": 0.0}
  ];
  final List moreMenu = [
    {"id": 1, "title": "首页", "icon": "home.png"},
    {"id": 2, "title": "消息通知", "icon": "message.png"},
    {"id": 3, "title": "喜欢的商品", "icon": "favor.png"},
  ];

  void updateShopNum(int count) {
    shopNum.value = count;
    update();
  }

  void updateSelectedAttr(String? cate, String? selected) {
    if (cate != null && cate.isNotEmpty && selected != null && selected.isNotEmpty) {
      if (selectedAttr != null && selectedAttr!.isNotEmpty) {
        selectedAttr?.forEach((key, value) {
          if (cate == key) {
            selectedAttr?.update(key, (value) => selected);
          }
        });
      }
    }
    update();
  }

  void buy() {

  }

  void addCart() async {
    bool res = await cartService.goodsDetailsSet(state!, selectedAttr, shopNum.value);
    String toast = "收藏失败.";
    if (res) {
      toast = "收藏成功.";
    }
    Fluttertoast.showToast(msg: toast, gravity: ToastGravity.CENTER);
  }

  void changeMoreSelected(int selected) {
    if (selected != moreSelected.value) {
      moreSelected.value = selected;
      update();
    }
    scrollController.animateTo(_getAndUpdateAnchorPoint(2),
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
  }

  void _changeSelectedId(int id) {
    if (id != selectedId.value) {
      selectedId.value = id;
      update();
    }
  }

  void onTarTitlePressed(int id) {
    scrollController.animateTo(
        tannerTitles[id - 1]['anchor_point'] +
            ScreenAdapter.height(id == 4 ? 110 : 10),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn);
  }

  double _getAnchorPoint(int index) {
    if (index == 0) {
      return 0.0;
    }
    GlobalKey contentKey = tannerTitles[index]['contentKey'] as GlobalKey;
    BuildContext? context = contentKey.currentContext;
    if (context != null) {
      RenderObject? renderObject = context.findRenderObject();
      if (renderObject != null) {
        RenderBox renderBox = renderObject as RenderBox;
        return renderBox
            .localToGlobal(Offset.zero)
            .dy +
            scrollController.offset -
            ScreenAdapter.height(index == 3 ? 325 : 225);
      }
    }
    return 0.0;
  }

  void _updateAnchorPoint(int index) {
    double anchorPoint = _getAnchorPoint(index);
    if (anchorPoint != tannerTitles[index]['anchor_point']) {
      tannerTitles[index]['anchor_point'] = anchorPoint;
    }
  }

  double _getAndUpdateAnchorPoint(int index) {
    _updateAnchorPoint(index);
    return tannerTitles[index]['anchor_point'];
  }

  double _getAndSaveAnchorPoint(int index) {
    _updateAnchorPoint(index);
    return tannerTitles[index]['anchor_point'];
  }

  void _addScrollListener() {
    scrollController.addListener(() {
      double offset = scrollController.offset;
      double current;
      double next;
      for (int i = 0; i < tannerTitles.length; i++) {
        current = _getAndSaveAnchorPoint(i);
        if (selectedId.value - 1 != i) {
          if (i == tannerTitles.length - 1) {
            if (offset > current) {
              showBottomMoreBar.value = false;
              _changeSelectedId(i + 1);
              update();
            }
            return;
          }
          next = _getAndSaveAnchorPoint(i + 1);
          if (current < offset && offset < next) {
            _changeSelectedId(i + 1);
            i == 2
                ? showBottomMoreBar.value = true
                : showBottomMoreBar.value = false;
            update();
            return;
          }
        }
      }
      update();
    });
  }

  @override
  void loadData() async {
    final Response<GoodsDetailsModel> response =
    await provider.getGoodsDetailsModel(query: query);
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
    _initAttrSelected();
  }

  void _initAttrSelected() {
    if (state == null) {
      return;
    }
    List<GoodsDetailsAttrModel>? attrs = state?.attrs;
    if (attrs == null || attrs.isEmpty) {
      return;
    }
    for (int i = 0; i < attrs.length; i++) {
      selectedAttr?.putIfAbsent(attrs[i].cate!, () => attrs[i].list![0]);
    }
  }

  void _initGlobalKey() {
    for (int i = 0; i < tannerTitles.length; i++) {
      tannerTitles[i]["contentKey"] = GlobalKey();
    }
  }

  void _initQuery() {
    query = Get.parameters;
  }

  @override
  void reset() {
    Get.find<ProductDetailsRecommendController>().onRefresh();
    Get.find<ProductDetailsCommentController>().onRefresh();
  }

  @override
  void init() {
    super.init();
    _initQuery();
    _initGlobalKey();
    _addScrollListener();
  }
}
