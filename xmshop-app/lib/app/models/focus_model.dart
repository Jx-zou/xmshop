class FocusModel {
  String? id;
  String? title;
  String? status;
  String? pic;
  String? url;
  int? position;

  FocusModel({
    this.id,
    this.title,
    this.status,
    this.pic,
    this.url,
    this.position,
  });

  FocusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    data['position'] = position;
    return data;
  }
}
