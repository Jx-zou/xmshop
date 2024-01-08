import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class CategorySecondController extends BaseController with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  String? id = "";

  CategorySecondController({required this.provider});

  void updateData(String? id) {
    this.id = id;
    loadData();
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