import 'package:get/get.dart';

import '../../../data/goods_details_provider.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IGoodsDetailsProvider>(() => GoodsDetailsProvider());

    Get.lazyPut<ProductDetailsController>(() => ProductDetailsController(Get.find<IGoodsDetailsProvider>()));
  }
}
