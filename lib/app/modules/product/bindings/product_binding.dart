import 'package:get/get.dart';
import 'package:xmshop/app/data/goods_provider.dart';
import 'package:xmshop/app/modules/product/controllers/product_controller.dart';



class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController(provider: Get.find<IGoodsProvider>()));
  }
}
