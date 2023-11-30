import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../models/goods_details_model.dart';
import 'storage_service.dart';

class CartService extends GetxService {
  final String cartKey = "cart";
  final StorageService storageService = Get.find<StorageService>();

  int find(List<CartItemModel>? items, String id, String selectedAttr) {
    if (items != null && items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        String? cartAttr = items[i].selectedAttr;
        if (cartAttr != null &&
            cartAttr.length == selectedAttr.length &&
            cartAttr == selectedAttr) {
          return i;
        }
      }
    }
    return -1;
  }

  Future<bool> setGoodsDetails(GoodsDetailsModel? goodsDetailsModel, String? selectedAttr, int? shopNum) async {
    if (goodsDetailsModel != null && selectedAttr != null && shopNum != null) {
      double price = goodsDetailsModel.price ?? 0;
      return await set("${goodsDetailsModel.id}", "${goodsDetailsModel.title}", price, "${goodsDetailsModel.pic}", selectedAttr, shopNum);
    }
    return Future(() => false);
  }

  Future<bool> setCart(CartModel? cartModel) async {
    return await storageService.set(cartKey, cartModel);
  }

  Future<bool> set(String id, String title, double price, String pic, String selectedAttr, int shopNum) async {
    CartModel? cart = await storageService.get(cartKey);
    if (cart == null) {
      cart = CartModel(normal: [], expire: []);
      cart.normal?.add(CartItemModel(
          id: id,
          title: title,
          price: price,
          selectedAttr: selectedAttr,
          count: shopNum,
          pic: pic));
      return await storageService.set(cartKey, cart);
    }
    cart.normal ??= [];
    int normalIndex = find(cart.normal, id, selectedAttr);
    if (normalIndex != -1) {
      cart.normal?.removeAt(normalIndex);
      cart.normal?.add(CartItemModel(
          id: id,
          title: title,
          price: price,
          selectedAttr: selectedAttr,
          count: shopNum,
          pic: pic));
      return await storageService.set(cartKey, cart);
    }
    cart.expire ??= [];
    int expireIndex = find(cart.expire, id, selectedAttr);
    if (expireIndex != -1) {
      cart.expire?.removeAt(expireIndex);
      cart.expire?.add(CartItemModel(
          id: id,
          title: title,
          price: price,
          selectedAttr: selectedAttr,
          count: shopNum,
          pic: pic));
      return await storageService.set(cartKey, cart);
    }
    return Future(() => false);
  }

  Future<CartModel?> get() async {
    CartModel? cart = await storageService.get(cartKey);
    if (cart != null) {
      return cart;
    }
    return null;
  }

  Future<bool> delete(String id, String selectedAttr) async {
    CartModel? cart = await storageService.get(cartKey);
    if (cart != null) {
    int normalIndex = find(cart.normal, id, selectedAttr);
    if (normalIndex != -1) {
      cart.normal?.removeAt(normalIndex);
      return await storageService.set(cartKey, cart);
    }
    int expireIndex = find(cart.expire, id, selectedAttr);
    if (expireIndex != -1) {
      cart.expire?.removeAt(expireIndex);
      return await storageService.set(cartKey, cart);
    }
  }
    return Future(() => false);
  }

  Future<bool> clear() async {
    CartModel? cart = await storageService.get(cartKey);
    if (cart != null) {
      return await storageService.remove(cartKey);
    }
    return Future(() => false);
  }

  void _init() async {
    bool flag = false;
    CartModel? cart = await storageService.get(cartKey);
    if (cart != null && cart.normal != null) {
      for (int i = 0; i < cart.normal!.length; i++) {
        if (cart.normal![i].isExpire) {
          cart.expire ??= [];
          cart.expire?.add(cart.normal![i]);
          flag = true;
        }
      }
      if (flag) {
        await storageService.set(cartKey, cart);
      }
    }
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
