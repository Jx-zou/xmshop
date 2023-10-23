/// result : [{"_id":"6332bc60a3a7080ac06eaee8","title":"小米12s","cid":"59f1e4919bfd8f3bd030eed6","price":2999,"pic":"public\\upload\\5xyr9OTSK1pwJ5ng7YgpKOkd.png","sub_title":"下单立减100","s_pic":"public\\upload\\5xyr9OTSK1pwJ5ng7YgpKOkd.png_200x200.png"},{"_id":"6332baefa3a7080ac06eaee7","title":"Note11 5G","cid":"59f1e1ada1da8b15d42234e9","price":1199,"pic":"public\\upload\\FFUxpJKHp3PteuEDMhO0c7v3.png","sub_title":"券后优惠100元","s_pic":"public\\upload\\FFUxpJKHp3PteuEDMhO0c7v3.png_200x200.png"},{"_id":"6332ba28a3a7080ac06eaee6","title":"MAX x86","cid":"59f1e1ada1da8b15d42234e9","price":5999,"pic":"public\\upload\\0AY3Cpw19ZQ2AkYjbA1tQY-Z.png","sub_title":"双120Hz高刷","s_pic":"public\\upload\\0AY3Cpw19ZQ2AkYjbA1tQY-Z.png_200x200.png"}]

class GoodsModel {
  GoodsModel({
    this.items,
  });

  GoodsModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      items = [];
      json['result'].forEach((v) {
        items?.add(GoodsItemModel.fromJson(v));
      });
    }
  }

  List<GoodsItemModel>? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (items != null) {
      map['result'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "6332bc60a3a7080ac06eaee8"
/// title : "小米12s"
/// cid : "59f1e4919bfd8f3bd030eed6"
/// price : 2999
/// pic : "public\\upload\\5xyr9OTSK1pwJ5ng7YgpKOkd.png"
/// sub_title : "下单立减100"
/// s_pic : "public\\upload\\5xyr9OTSK1pwJ5ng7YgpKOkd.png_200x200.png"

class GoodsItemModel {
  GoodsItemModel({
    this.id,
    this.title,
    this.cid,
    this.price,
    this.pic,
    this.subTitle,
    this.sPic,
  });

  GoodsItemModel.fromJson(dynamic json) {
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
}
