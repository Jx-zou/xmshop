/// result : [{"_id":"59f1e1ada1da8b15d42234e9","title":"电脑办公","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"59f1e1e880e7ed050cec999d","title":"女装内衣","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"59f1e4659bfd8f3bd030eed3","title":"运动户外","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"59f1e46e9bfd8f3bd030eed4","title":"手机数码","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"59f1e47e9bfd8f3bd030eed5","title":"化妆品","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"5a04251e010e711234661438","title":"箱包","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"5a04261e010e71123466143a","title":"女鞋","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"5a042e29010e711234661443","title":"汽车用品","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"5a042f27010e711234661446","title":"酒水饮料","status":1,"pic":"","pid":"0","sort":100,"go_product":0,"product_id":""},{"_id":"633122b71d033b0970c714b8","title":"穿戴设备","status":1,"pic":"public\\upload\\ObTaeolxy6fJ50vPMBhCS_sO","pid":"0","sort":0,"go_product":0,"product_id":""}]

class PCateModel {
  PCateModel({this.items});

  PCateModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      items = [];
      json['result'].forEach((v) {
        items?.add(PCateItemModel.fromJson(v));
      });
    }
  }

  List<PCateItemModel>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['result'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "59f1e1ada1da8b15d42234e9"
/// title : "电脑办公"
/// status : 1
/// pic : ""
/// pid : "0"
/// sort : 100
/// go_product : 0
/// product_id : ""

class PCateItemModel {
  PCateItemModel({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.pid,
    this.sort,
    this.goProduct,
    this.productId,
  });

  PCateItemModel.fromJson(dynamic json) {
    id = json['_id'];
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
    map['_id'] = id;
    map['title'] = title;
    map['status'] = status;
    map['pic'] = pic;
    map['pid'] = pid;
    map['sort'] = sort;
    map['go_product'] = goProduct;
    map['product_id'] = productId;
    return map;
  }

  @override
  String toString() {
    return 'PCateItemModel{id: $id, title: $title, status: $status, pic: $pic, pid: $pid, sort: $sort, goProduct: $goProduct, productId: $productId}';
  }
}
