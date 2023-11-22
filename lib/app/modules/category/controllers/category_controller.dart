import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/category_provider.dart';
import '../../../models/category_model.dart';

class CategoryController extends BaseController with StateMixin<List<CategoryModel>> {
  final ICategoryProvider provider;
  final Rx<List<CategoryModel>> secondCategory = Rx(<CategoryModel>[]);
  final RxInt selectIndex = 0.obs;

  CategoryController({required this.provider});

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    loadSecondCategoryData(state?[index].id);
    update();
  }

  void toProduct(String id) {
    Get.offAndToNamed("/product", parameters: {"requestKey": "cid", "requestValue": id});
  }

  void loadSecondCategoryData(String? id) async {
    if (id != null) {
      final Response response = await provider.getPCateModel(query: {"pid": id});
      if (response.hasError) {
        return;
      }
      secondCategory.value = response.body;
      update();
    }
  }

  @override
  void loadData() async {
    final Response response = await provider.getPCateModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
    loadSecondCategoryData(state?[selectIndex.value].id);
  }
}
