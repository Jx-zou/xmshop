import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeHotListController extends BaseController with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;

  HomeHotListController({required this.provider});

  @override
  void loadData() async {
    final response = await provider.getGoodsModel(query: {"is_hot": "1", "pageSize": "3"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
  }
}