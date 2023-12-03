import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/goods_details_model.dart';
import 'storage_service.dart';

class CartService extends GetxService {
  final String cartKey = "cart";
  final StorageService storageService = Get.find<StorageService>();

  CartModel goodsDetailsToModel(GoodsDetailsModel goodsDetails, String selectedAttr, int shopNum) {
    return CartModel(
        id: goodsDetails.id,
        title: goodsDetails.title,
        price: goodsDetails.price,
        pic: goodsDetails.pic,
        selectedAttr: selectedAttr,
        count: shopNum);
  }

  int find(List<CartModel>? items, String? id, String? selectedAttr) {
    if (items != null && id != null && selectedAttr != null && items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        String? cartAttr = items[i].selectedAttr;
        if (cartAttr != null && cartAttr.length == selectedAttr.length && cartAttr == selectedAttr) {
          return i;
        }
      }
    }
    return -1;
  }

  Future<bool> setGoodsDetails(GoodsDetailsModel? goodsDetails, String? selectedAttr, int? shopNum) async {
    if (goodsDetails != null && selectedAttr != null && shopNum != null) {
      return await set(goodsDetailsToModel(goodsDetails, selectedAttr, shopNum));
    }
    return false;
  }

  Future<bool> setList(List<CartModel>? carts) async {
    if(carts == null) {
      return false;
    }
    return await storageService.set(cartKey, carts);
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
    int index = find(carts, cart.id, cart.selectedAttr);
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

  Future<bool> delete(String id, String selectedAttr) async {
    List<CartModel>? carts = await storageService.get(cartKey);
    if (carts != null) {
      int index = find(carts, id, selectedAttr);
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
