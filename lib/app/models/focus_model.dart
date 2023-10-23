class FocusModel {
  List<FocusItemModel>? items;

  FocusModel({this.items});

  FocusModel.fromJson(dynamic json) {
    if (json != null && json['result'] != null) {
      items = <FocusItemModel>[];
      json['result'].forEach((v) {
        items?.add(FocusItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (items != null) {
      data['result'] = items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class FocusItemModel {
  String? sId;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  FocusItemModel(
      {this.sId, this.title, this.status, this.pic, this.url, this.position});

  FocusItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
