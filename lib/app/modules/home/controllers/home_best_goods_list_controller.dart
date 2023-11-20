import 'package:get/get.dart';

import 'home_controller.dart';
import '../../../common/controllers/waterfall_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeBestGoodsListController extends WaterfallController<GoodsModel> {
  final IGoodsProvider provider;

  HomeBestGoodsListController({required this.provider}) : super(Get.find<HomeController>().scrollController, query: {"is_best": "1"}, offset: 15);

  @override
  Future<Response<List<GoodsModel>>> getData() {
    return provider.getGoodsModel(query: super.query);
  }
}
