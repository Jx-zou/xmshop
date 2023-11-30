import 'package:get/get.dart';

import 'product_details_controller.dart';
import '../../../common/controllers/waterfall_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class ProductDetailsRecommendedController
    extends WaterfallController<GoodsModel> {
  final IGoodsProvider provider;

  ProductDetailsRecommendedController({required this.provider})
      : super(Get.find<ProductDetailsController>().scrollController,
            query: {"is_best": "1"}, offset: 15);

  @override
  Future<Response<List<GoodsModel>>> getData() {
    return provider.getGoodsModel(query: super.query);
  }
}