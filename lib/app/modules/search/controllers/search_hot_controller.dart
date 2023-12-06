import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/goods_provider.dart';
import '../../../models/goods_model.dart';

class SearchHotController extends BaseController with StateMixin<List<GoodsModel>>{
  final IGoodsProvider provider;
  SearchHotController({required this.provider});

  @override
  void loadData() async {
    final response = await provider.getGoodsModel(query: {"is_best": "1", "pageSize": "8"});
    if (response.hasError) {
      change(null, status: RxStatus.error());
    } else if(response.body == null || response.body!.isEmpty) {
      change(response.body, status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
    }
  }
}