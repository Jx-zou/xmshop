class GoodsModel {
  GoodsModel({
    this.id,
    this.title,
    this.cid,
    this.price,
    this.pic,
    this.subTitle,
    this.sPic,
  });

  GoodsModel.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  String? id;
  String? title;
  String? cid;
  num? price;
  String? pic;
  String? subTitle;
  String? sPic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['title'] = title;
    map['cid'] = cid;
    map['price'] = price;
    map['pic'] = pic;
    map['sub_title'] = subTitle;
    map['s_pic'] = sPic;
    return map;
  }

  @override
  String toString() {
    return 'GoodsItemModel{id: $id, title: $title, cid: $cid, price: $price, pic: $pic, subTitle: $subTitle, sPic: $sPic}';
  }
}
