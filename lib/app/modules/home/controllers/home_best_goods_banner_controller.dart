import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeBestGoodsBannerController extends BaseController with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;

  HomeBestGoodsBannerController({required this.provider});

  @override
  void loadData() async {
    final response =
        await provider.getGoodsModel(query: {"is_best": "1", "pageSize": "4"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
  }
}
