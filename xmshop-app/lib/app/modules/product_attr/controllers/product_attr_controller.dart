import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../models/goods_details_model.dart';

class ProductAttrController extends BaseController {
  final Map<String, String>? selectedAttr = {};

  final RxInt shopNum = 1.obs;

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

  void updateShopNum(int count) {
    shopNum.value = count;
    update();
  }

  void initSelectedAttr(List<GoodsDetailsAttrModel>? attrs) {
    if (attrs == null || attrs.isEmpty) {
      return;
    }
    for (int i = 0; i < attrs.length; i++) {
      selectedAttr?.putIfAbsent(attrs[i].cate!, () => attrs[i].list![0]);
    }
  }
}