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
      this.status, 
      this.pic, 
      this.content, 
      this.cname, 
      this.attr, 
      this.subTitle, 
      this.salecount, 
      this.specs,});

  GoodsDetailsModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    if (json['attr'] != null) {
      attr = [];
      json['attr'].forEach((v) {
        attr?.add(Attr.fromJson(v));
      });
    }
    subTitle = json['sub_title'];
    salecount = json['salecount'];
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
  num? status;
  String? pic;
  String? content;
  String? cname;
  List<Attr>? attr;
  String? subTitle;
  num? salecount;
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
    map['status'] = status;
    map['pic'] = pic;
    map['content'] = content;
    map['cname'] = cname;
    if (attr != null) {
      map['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    map['sub_title'] = subTitle;
    map['salecount'] = salecount;
    map['specs'] = specs;
    return map;
  }
}

class Attr {
  Attr({
      this.cate, 
      this.list,});

  Attr.fromJson(dynamic json) {
    cate = json['cate'];
    list = json['list'] != null ? json['list'].cast<String>() : [];
  }
  String? cate;
  List<String>? list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cate'] = cate;
    map['list'] = list;
    return map;
  }
}