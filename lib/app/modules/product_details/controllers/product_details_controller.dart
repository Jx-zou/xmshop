import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../common/utils/toast_utils.dart';
import '../../../data/goods_details_provider.dart';
import '../../../models/goods_details_model.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../services/cart_service.dart';

class ProductDetailsController extends BaseController with StateMixin<GoodsDetailsModel> {
  final IGoodsDetailsProvider provider;
  ProductDetailsController({required this.provider});
  Map<String, String> query = {};
  final ScrollController scrollController = ScrollController();
  final CartService cartService = Get.find<CartService>();

  final List<Map<String, dynamic>> tannerTitles = [
    {"id": 1, "contentKey": "", "title": "商品", "anchor_point": 0.0},
    {"id": 2, "contentKey": "", "title": "评价", "anchor_point": 0.0},
    {"id": 3, "contentKey": "", "title": "详情", "anchor_point": 0.0},
    {"id": 4, "contentKey": "", "title": "推荐", "anchor_point": 0.0}
  ];
  final List moreMenu = [
    {"id": 1, "title": "首页", "icon": XmshopIcons.home},
    {"id": 2, "title": "消息通知", "icon": XmshopIcons.message},
    {"id": 3, "title": "喜欢的商品", "icon": XmshopIcons.collect}
  ];

  final List<String> picList = [
    "https://p4.itc.cn/images01/20211031/d0ff5fcb10e240928bc0ec46b8d71fbf.jpeg",
    "https://files.jb51.net/file_images/article/201407/20140730091343112.jpg",
    "https://k-static.appmobile.cn/uploads/allimg/211207/28-21120G43118.jpg",
    "https://img1.mydrivers.com/img/20220927/d35930cd-b2d6-4a59-a11d-1ecc4c163c47_1000.jpg"
  ];

  final RxString selectedAttr = "".obs;
  final RxInt shopNum = 1.obs;
  final RxDouble appBarOpacity = 0.0.obs;
  final Rx<Color> actionColor = Colors.white.obs;
  final RxInt selectedId = 1.obs;
  final RxBool showMoreTar = false.obs;
  final RxInt moreSelected = 1.obs;

  void buy() {
    Get.back();
  }

  void addCart() async {
    Get.back();
    ToastUtils.centerToast(await cartService.setGoodsDetails(state!, selectedAttr.value, shopNum.value) ? "收藏成功." : "收藏失败.");
  }

  void updateAttrs(String selectedAttr, int shopNum) {
    this.selectedAttr.value = selectedAttr;
    this.shopNum.value = shopNum;
    update();
  }

  void changeMoreSelected(int selected) {
    if (selected != moreSelected.value) {
      moreSelected.value = selected;
    }
    scrollController.animateTo(_getAndUpdateAnchorPoint(2), duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
    update();
  }

  void _changeSelectedId(int id) {
    selectedId.value = id;
    update();
  }

  void onTarTitlePressed(int id) {
    scrollController.animateTo(
        tannerTitles[id - 1]['anchor_point'] + ScreenAdapter.height(id == 4 ? 110 : 10),
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
        return renderBox.localToGlobal(Offset.zero).dy + scrollController.offset - ScreenAdapter.height(index == 3 ? 325 : 225);
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
      if (offset <= 75) {
        appBarOpacity.value = offset / 75;
        actionColor.value = Colors.white;
      } else {
        appBarOpacity.value = 1;
        actionColor.value = Colors.black;
      }
      double current;
      double next;
      for (int i = 0; i < tannerTitles.length; i++) {
        current = _getAndSaveAnchorPoint(i);
        if (selectedId.value - 1 != i) {
          if (i == tannerTitles.length - 1) {
            if (offset > current) {
              showMoreTar.value = false;
              _changeSelectedId(i + 1);
              update();
            }
            return;
          }
          next = _getAndSaveAnchorPoint(i + 1);
          if (current < offset && offset < next) {
            _changeSelectedId(i + 1);
            i == 2 ? showMoreTar.value = true : showMoreTar.value = false;
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
    final Response<GoodsDetailsModel> response = await provider.getGoodsDetailsModel(query: query);
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
    _initAttrSelected();
  }

  void _initAttrSelected() {
    if (state != null) {
      List<GoodsDetailsAttrModel>? attrs = state?.attr;
      if (attrs != null) {
        for (int i = 0; i < attrs.length; i++) {
          selectedAttr.value += "${attrs[i].list![0]}  ";
        }
      }
    }
  }

  void _initGlobalKey() {
    for (int i = 0; i < tannerTitles.length; i++) {
      tannerTitles[i]["contentKey"] = GlobalKey();
    }
  }

  void _initQuery() {
    query = {
      "${Get.parameters['requestKey']}": "${Get.parameters['requestValue']}"
    };
  }

  @override
  void init() {
    _initQuery();
    _initGlobalKey();
    _addScrollListener();
  }

  @override
  void close() {
    scrollController.dispose();
  }
}
