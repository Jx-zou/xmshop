import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class SearchHotController extends BaseController with StateMixin<List<GoodsModel>>{
  final IGoodsProvider provider;
  SearchHotController({required this.provider});

  onHotTap(String? id) {
    if (id != null) {
      Get.offAndToNamed("product-details", parameters: {
        "requestKey": "id",
        "requestValue": id
      });
    }
  }

  @override
  void loadData() async {
    final response = await provider.getGoodsModel(query: {"is_hot": "1", "pageSize": "8"});
    if (response.hasError) {
      change(null, status: RxStatus.error());
      return;
    }
    change(response.body, status: RxStatus.success());
  }
}