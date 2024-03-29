import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../models/cart_model.dart';
import '../../../services/cart_service.dart';

class CartController extends BaseController with StateMixin<List<CartModel>> {
  final ScrollController scrollController = ScrollController();
  final CartService cartService = Get.find<CartService>();

  final RxBool allSelected = false.obs;
  final RxNum totalPrice = RxNum(0);
  final RxString total = "".obs;

  void updateAttr(CartModel cartModel, int index) {
    if (state != null && state!.isNotEmpty) {
      state?[index] = cartModel;
      update();
      saveCart(state![index]);
    }
  }

  void updateCount(int index, int count) {
    if (state != null && state!.isNotEmpty) {
      state?[index].count = count;
      update();
      saveCart(state![index]);
    }
  }

  void saveCart(CartModel cartModel) async {
    await cartService.set(cartModel);
  }

  void updateTotal() {
    if (state != null) {
      int total = 0;
      for (int i = 0; i < state!.length; i++) {
        if (!state![i].isExpire && state![i].checked) {
          total++;
        }
      }
      if (total == 0) {
        this.total.value = "";
      }
      this.total.value = "($total)";
      update();
    }
  }

  void updateTotalPrice() {
    num total = 0;
    for (int i = 0; i < state!.length; i++) {
      total += state![i].price!;
    }
    totalPrice.value = total;
    update();
  }

  void changeAllSelected() {
    if (state != null && state!.isNotEmpty) {
      for (int i = 0; i < state!.length; i++) {
        if (!state![i].isExpire) {
          state?[i].checked = !allSelected.value;
        }
      }
      allSelected.value = !allSelected.value;
    }
    update();
  }

  void updateAllSelected() {
    if (state!.isNotEmpty) {
      for (int i = 0; i < state!.length; i++) {
        if (!state![i].checked) {
          return;
        }
      }
      allSelected.value = true;
      update();
    }
  }

  @override
  void loadData() async {
    List<CartModel>? carts = await cartService.get();
    if (carts == null || carts.isEmpty) {
      change([], status: RxStatus.empty());
      return;
    }
    change(carts, status: RxStatus.success());
    updateAllSelected();
    updateTotalPrice();
  }
}
