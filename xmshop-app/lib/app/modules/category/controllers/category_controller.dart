import 'package:get/get.dart';
import 'package:xmshop/app/modules/category/controllers/category_second_controller.dart';

import '../../../controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class CategoryController extends BaseController with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  final CategorySecondController secondCategoryController = Get.find<CategorySecondController>();
  final RxInt selectIndex = 0.obs;

  CategoryController({required this.provider});

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    updateSecondCategoryData();
    update();
  }

  void updateSecondCategoryData() {
    secondCategoryController.updateData(state![selectIndex.value].id);
  }



  @override
  void loadData() async {
    final Response response = await provider.getCategoryModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else if (response.body.isEmpty) {
      change(response.body, status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
      updateSecondCategoryData();
    }
  }
}
