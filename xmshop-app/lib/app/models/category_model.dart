class CategoryModel {
  CategoryModel({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.pid,
    this.sort,
    this.goProduct,
    this.productId,
  });

  CategoryModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'] is String ? num.tryParse(json['sort']) : json['sort'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  String? id;
  String? title;
  num? status;
  String? pic;
  String? pid;
  num? sort;
  num? goProduct;
  String? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    map['go_product'] = goProduct;
    map['product_id'] = productId;
    return map;
  }
}
