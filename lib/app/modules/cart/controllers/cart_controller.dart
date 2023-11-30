import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../models/cart_model.dart';
import '../../../services/cart_service.dart';

class CartController extends BaseController with StateMixin<CartModel> {
  final ScrollController scrollController = ScrollController();
  final CartService cartService = Get.find<CartService>();

  void addShopNum(String? id, String? selectedAttr) {
    if (id != null && selectedAttr != null) {
      int index = cartService.find(state?.normal, id, selectedAttr);
      state!.normal?[index].count++;
    }
  }

  void reduceShopNum(String? id, String? selectedAttr, int count) {
    if (id != null && selectedAttr != null && count > 1) {
      int index = cartService.find(state?.normal, id, selectedAttr);
      state!.normal?[index].count--;
    }
  }

  @override
  void loadData() async {
    CartModel? cartModel = await cartService.get();
    if (cartModel == null) {
      change(null, status: RxStatus.error());
      return;
    }
    change(cartModel, status: RxStatus.success());
  }

  @override
  void close() {
    cartService.setCart(state);
  }
}
