class BestCategoryModel {

  List<Result>? items;
  BestCategoryModel({
    this.items,
  });

  BestCategoryModel.fromJson(dynamic json) {
    if (json != null && json['result'] != null) {
      items = [];
      json['result'].forEach((v) {
        items?.add(Result.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['result'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Result {
  Result({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.pid,
    this.sort,
    this.isBest,
    this.goProduct,
    this.productId,
  });

  Result.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    pid = json['pid'];
    sort = json['sort'];
    isBest = json['is_best'];
    goProduct = json['go_product'];
    productId = json['product_id'];
  }

  String? id;
  String? title;
  num? status;
  String? pic;
  String? pid;
  num? sort;
  num? isBest;
  num? goProduct;
  String? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    map['is_best'] = isBest;
    map['go_product'] = goProduct;
    map['product_id'] = productId;
    return map;
  }
}
