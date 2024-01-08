import 'package:get/get.dart';

enum RouteType {name, off}

class Routes {
  Routes._();

  static void toProductDetails(String? id, {RouteType? type}) {
    if (id != null && id.isNotEmpty) {
      _to("/product-details", parameters: {"id": id}, type: type);
    }
  }

  static void toProduct({String? keywords, String? cid, RouteType? type}) {
    if (keywords != null && keywords.isNotEmpty) {
      _to("/product", parameters: {"search": keywords}, type: type);
      return;
    }
    if (cid != null && cid.isNotEmpty) {
      _to("/product", parameters: {"cid": cid}, type: type);
    }
  }

  static void _to(String page, {Map<String, String>? parameters, dynamic arguments, RouteType? type}) {
    switch(type) {
      case RouteType.off: Get.offAndToNamed(page, parameters: parameters, arguments: arguments);
      default: Get.toNamed(page, parameters: parameters, arguments: arguments);
    }
  }
}