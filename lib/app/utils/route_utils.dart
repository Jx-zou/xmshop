import 'package:get/get.dart';

class RouteUtils {
  RouteUtils._();

  static toGoodsDetails(String key, String? value) {
    if (value != null) {
      Get.toNamed("product-details",
          parameters: {"requestKey": key, "requestValue": value});
    }
  }
}