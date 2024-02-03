class GoodsDetailsModel {
  GoodsDetailsModel({
    this.id,
    this.title,
    this.cid,
    this.price,
    this.oldPrice,
    this.isBest,
    this.isHot,
    this.isNew,
    this.attrs,
    this.status,
    this.pic,
    this.content,
    this.cname,
    this.subTitle,
    this.specs,
  });

  GoodsDetailsModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    if (json['attr'] != null) {
      attrs = [];
      json['attr'].forEach((v) {
        attrs?.add(GoodsDetailsAttrModel.fromJson(v));
      });
    }
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    subTitle = json['sub_title'];
    specs = json['specs'];
  }

  String? id;
  String? title;
  String? cid;
  num? price;
  num? oldPrice;
  num? isBest;
  num? isHot;
  num? isNew;
  List<GoodsDetailsAttrModel>? attrs;
  num? status;
  String? pic;
  String? content;
  String? cname;
  String? subTitle;
  String? specs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['cid'] = cid;
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['is_best'] = isBest;
    map['is_hot'] = isHot;
    map['is_new'] = isNew;
    if (attrs != null) {
      map['attr'] = attrs?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['pic'] = pic;
    map['content'] = content;
    map['cname'] = cname;
    map['sub_title'] = subTitle;
    map['specs'] = specs;
    return map;
  }
}

class GoodsDetailsAttrModel {
  GoodsDetailsAttrModel({
    this.cate,
    this.list,
    this.selected,
  });

  GoodsDetailsAttrModel.fromJson(dynamic json) {
    cate = json['cate'];
    list = json['list'] != null ? json['list'].cast<String>() : [];
    selected = "";
  }

  String? cate;
  List<String>? list;
  String? selected;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cate'] = cate;
    map['list'] = list;
    return map;
  }
}
