import 'package:get/get.dart';

import 'second_category_controller.dart';
import '../../../common/controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class CategoryController extends BaseController
    with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  final SecondCategoryController secondCategoryController =
      Get.find<SecondCategoryController>();

  CategoryController({required this.provider});

  final RxInt selectIndex = 0.obs;

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    secondCategoryController.updateSecondCategory("${state![index].id}");
    update();
  }

  @override
  void loadData() async {
    final Response response = await provider.getPCateModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }
}
