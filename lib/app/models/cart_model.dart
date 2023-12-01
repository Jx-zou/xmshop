class CartModel {
  List<CartItemModel>? expire;
  List<CartItemModel>? normal;

  CartModel({this.expire, this.normal});
}

class CartItemModel {
  String? id;
  String? title;
  num? price;
  String? selectedAttr;
  int count;
  String? pic;
  bool checked;
  bool isExpire;

  CartItemModel(
      {this.id,
      this.title,
      this.price,
      this.selectedAttr,
      this.count = 1,
      this.pic,
      this.checked = true,
      this.isExpire = false});
}
