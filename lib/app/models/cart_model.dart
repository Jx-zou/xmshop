class CartModel {
  String? id;
  String? title;
  num? price;
  String? selectedAttr;
  int count;
  String? pic;
  bool checked;
  bool isExpire;

  CartModel(
      {this.id,
      this.title,
      this.price,
      this.selectedAttr,
      this.count = 1,
      this.pic,
      this.checked = true,
      this.isExpire = false});
}
