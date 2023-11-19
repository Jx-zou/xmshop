import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class SecondCategoryController extends BaseController
    with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  String id = "";

  SecondCategoryController({required this.provider});

  updateSecondCategory(String id) {
    this.id = id;
    loadData();
  }

  onTap(String id) {
    Get.offAndToNamed("/product",
        parameters: {"requestKey": "cid", "requestValue": id});
  }

  @override
  void loadData() async {
    final Response response = await provider.getPCateModel(query: {"pid": id});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
  }
}
