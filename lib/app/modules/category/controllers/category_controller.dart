import 'package:get/get.dart';

import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class CategoryController extends GetxController with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  CategoryController({required this.provider});

  RxList<CategoryModel> categoryModels = <CategoryModel>[].obs;
  final RxInt selectIndex = 0.obs;

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    updateCategoryModel();
    update();
  }

  void updateCategoryModel() async {
    final Response response = await provider.getPCateModel(query: {"pid": state?[selectIndex.value].id});
    if (response.hasError) {
      categoryModels.value = <CategoryModel>[].obs;
    } else {
      categoryModels.value = response.body;
    }
    update();
  }

  void getCategoryModel() async {
    final Response response = await provider.getPCateModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
      updateCategoryModel();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getCategoryModel();
  }
}
