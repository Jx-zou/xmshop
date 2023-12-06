import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class SecondCategoryController extends BaseController with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  String? id = "";

  SecondCategoryController({required this.provider});

  void updateData(String? id) {
    this.id = id;
    loadData();
  }

  void toProduct(String? id) {
    if(id != null && id.isNotEmpty) {
      Get.offAndToNamed("/product", parameters: {"requestKey": "cid", "requestValue": id});
    }
  }

  @override
  void loadData() async {
    if (id == null || id!.isEmpty) {
      change(null, status: RxStatus.error("id不能为空"));
    }
    final Response<List<CategoryModel>> response = await provider.getPCateModel(query: {"pid": id});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else if (response.body!.isEmpty) {
      change(response.body, status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
    }
  }
}