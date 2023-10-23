import 'package:get/get.dart';
import 'package:xmshop/app/models/goods_model.dart';

import '../../../data/goods_provider.dart';

class HomeBestGoodsBannerController extends GetxController with StateMixin<GoodsModel> {
  final IGoodsProvider provider;
  HomeBestGoodsBannerController({required this.provider});

  _getGoodsModel() async {
    final response = await provider.getGoodsModel(query: {"is_best": "1", "pageSize": "4"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    _getGoodsModel();
  }
}