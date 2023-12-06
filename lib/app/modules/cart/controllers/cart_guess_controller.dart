import 'package:get/get.dart';

import '../../../common/controllers/page/scroll_page_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';
import 'cart_controller.dart';

class CartGuessController extends ScrollPageController<GoodsModel> {
  final IGoodsProvider provider;

  CartGuessController({required this.provider}) : super(scrollController: Get.find<CartController>().scrollController, query: {"is_best": "1"}, offset: 15);

  @override
  Future<Response<List<GoodsModel>>> getData() {
    return provider.getGoodsModel(query: super.query);
  }
}