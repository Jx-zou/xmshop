import 'package:get/get.dart';

import '../controllers/xm_search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XmSearchController>(() => XmSearchController());
  }
}
