import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/goods_details_model.dart';
import 'storage_service.dart';

class CartService extends GetxService {
  final String cartKey = "cart";
  final StorageService storageService = Get.find<StorageService>();

  CartModel goodsDetailsToModel(GoodsDetailsModel goodsDetails, Map<String, String> selectedAttr, int shopNum) {
    return CartModel(
      id: goodsDetails.id,
      pic: goodsDetails.pic,
      title: goodsDetails.title,
      price: goodsDetails.price,
      selectedAttr: selectedAttr,
      attrs: goodsDetails.attrs,
      count: shopNum,
    );
  }

  int find(List<CartModel>? items, Map<String, String>? selectedAttr) {
    if (items == null || selectedAttr == null || selectedAttr.isEmpty) {
      return -1;
    }
    for (int i = 0; i < items.length; i++) {
      Map<String, String>? cartAttr = items[i].selectedAttr;
      if (cartAttr == null || cartAttr.isEmpty) {
        return -1;
      }
      if (cartAttr.length == selectedAttr.length && cartAttr == selectedAttr) {
        return i;
      }
    }
    return -1;
  }

  Future<bool> goodsDetailsSet(GoodsDetailsModel? goodsDetails, Map<String, String>? selectedAttr, int? shopNum) async {
    if (goodsDetails != null && selectedAttr != null && shopNum != null) {
      return await set(goodsDetailsToModel(goodsDetails, selectedAttr, shopNum));
    }
    return false;
  }

  Future<bool> set(CartModel? cart) async {
    if (cart == null) {
      return false;
    }
    List<CartModel>? carts = await storageService.get(cartKey);
    if (carts == null) {
      carts = [];
      carts.add(cart);
      return await storageService.set(cartKey, carts);
    }
    int index = find(carts, cart.selectedAttr);
    if (index != -1) {
      carts.removeAt(index);
      carts.add(cart);
      return await storageService.set(cartKey, cart);
    }
    return false;
  }

  Future<List<CartModel>?> get() async {
    List<CartModel>? carts = await storageService.get(cartKey);
    if (carts != null) {
      return carts;
    }
    return null;
  }

  Future<bool> delete(String id, Map<String, String> selectedAttr) async {
    List<CartModel>? carts = await storageService.get(cartKey);
    if (carts != null) {
      int index = find(carts, selectedAttr);
      if (index != -1) {
        carts.removeAt(index);
        return await storageService.set(cartKey, carts);
      }
    }
    return false;
  }

  Future<bool> clear() async {
    if (storageService.contains(cartKey)) {
      return await storageService.remove(cartKey);
    }
    return false;
  }
}
