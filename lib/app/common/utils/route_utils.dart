import 'package:get/get.dart';

class RouteUtils {
  RouteUtils._();

  static to(String path, String key, String? value) {
    if (value != null && value.isNotEmpty) {
      Get.toNamed(path,
          parameters: {"requestKey": key, "requestValue": value});
    }
  }
}