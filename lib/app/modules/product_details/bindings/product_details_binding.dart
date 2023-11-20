import 'package:get/get.dart';

import '../../../data/goods_provider.dart';
import '../../../data/goods_details_provider.dart';
import '../controllers/product_details_controller.dart';
import '../controllers/product_details_recommended_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IGoodsDetailsProvider>(() => GoodsDetailsProvider());

    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(provider: Get.find<IGoodsDetailsProvider>()));
    Get.lazyPut<ProductDetailsRecommendedController>(() => ProductDetailsRecommendedController(provider: Get.find<IGoodsProvider>()));
  }
}
