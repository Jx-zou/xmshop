import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../models/cart_model.dart';
import '../../../services/cart_service.dart';

class CartController extends BaseController with StateMixin<CartModel> {
  final ScrollController scrollController = ScrollController();
  final CartService cartService = Get.find<CartService>();
  final RxBool allSelected = false.obs;

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

  void changeAllSelected() {
    if(state != null && state?.normal != null && state!.normal!.isNotEmpty) {
      for(int i = 0; i < state!.normal!.length; i++) {
        state!.normal?[i].checked = !allSelected.value;
      }
      allSelected.value = !allSelected.value;
    }
    update();
  }

  bool isAllSelected(List<CartItemModel>? cartItemModels) {
    if (cartItemModels == null) {
      return false;
    }
    for (CartItemModel value in cartItemModels) {
      if (!value.checked) {
        return false;
      }
    }
    return true;
  }

  void _initAllSelected() {
    if (state!.normal!.isNotEmpty) {
      for (int i = 0; i < state!.normal!.length; i++) {
        if (!state!.normal![i].checked) {
          return;
        }
      }
      allSelected.value = true;
      update();
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
    _initAllSelected();
  }

  @override
  void close() {
    cartService.setCart(state);
  }
}
