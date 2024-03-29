import 'package:get/get.dart';

import '../../../controllers/page/scroll_page_controller.dart';
import 'home_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeBestWaterfallController extends ScrollPageController<GoodsModel> {
  final IGoodsProvider provider;

  HomeBestWaterfallController({required this.provider}) : super(scrollController: Get.find<HomeController>().scrollController, query: {"is_best": "1"}, offset: 15);

  @override
  Future<Response<List<GoodsModel>>> getData() {
    return provider.getGoodsModel(query: super.query);
  }
}