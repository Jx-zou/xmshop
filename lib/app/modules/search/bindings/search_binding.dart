import 'package:get/get.dart';

import '../../../data/goods_provider.dart';
import '../controllers/search_guess_controller.dart';
import '../controllers/search_hot_controller.dart';
import '../controllers/xm_search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<XmSearchController>(() => XmSearchController());
    Get.lazyPut<SearchGuessController>(() => SearchGuessController());
    Get.lazyPut<SearchHotController>(() => SearchHotController(provider: Get.find<IGoodsProvider>()));
  }
}
