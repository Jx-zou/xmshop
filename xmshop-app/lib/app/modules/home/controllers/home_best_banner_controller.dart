import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeBestBannerController extends BaseController with StateMixin<List<GoodsModel>> {
  final IGoodsProvider provider;

  HomeBestBannerController({required this.provider});

  @override
  void loadData() async {
    final Response<List<GoodsModel>> response = await provider.getGoodsModel(query: {"is_best": "1", "pageSize": "4"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else if (response.body!.isEmpty) {
      change(response.body, status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
    }
  }
}
