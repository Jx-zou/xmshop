import 'package:xmshop/app/models/goods_details_model.dart';

class CartModel {
  String? id;
  String? title;
  num? price;
  Map<String, String>? selectedAttr;
  List<GoodsDetailsAttrModel>? attrs;
  int count;
  String? pic;
  bool checked;
  bool isExpire;

  CartModel({
    this.id,
    this.title,
    this.price,
    this.selectedAttr,
    this.attrs,
    this.count = 1,
    this.pic,
    this.checked = true,
    this.isExpire = false,
  });
}
