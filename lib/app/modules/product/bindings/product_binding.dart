import 'package:get/get.dart';

import '../../../data/goods_provider.dart';
import '../controllers/product_controller.dart';



class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(provider: Get.find<IGoodsProvider>()));
  }
}