import 'package:get/get.dart';

import '../../../controllers/page/scroll_page_controller.dart';
import 'product_details_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class ProductDetailsRecommendController extends ScrollPageController<GoodsModel> {
  final IGoodsProvider provider;

  ProductDetailsRecommendController({required this.provider})
      : super(
            scrollController:
                Get.find<ProductDetailsController>().scrollController,
            query: {"is_best": "1"});

  @override
  Future<Response<List<GoodsModel>>> getData() {
    return provider.getGoodsModel(query: super.query);
  }
}
