import 'package:get/get.dart';

import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class HomeHotGoodsListController extends GetxController with StateMixin<List<GoodsModel>> {

  final IGoodsProvider provider;

  HomeHotGoodsListController({required this.provider});

  _getPlistData() async {
    final response = await provider.getGoodsModel(query: {"is_hot": "1", "pageSize": "3"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    _getPlistData();
  }
}