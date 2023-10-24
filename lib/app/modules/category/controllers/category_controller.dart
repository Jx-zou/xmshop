import 'dart:developer';

import 'package:get/get.dart';
import 'package:xmshop/app/data/pcate_provider.dart';
import 'package:xmshop/app/models/pcate_model.dart';

class CategoryController extends GetxController with StateMixin<PCateModel> {
  final IPCateProvider provider;
  CategoryController({required this.provider});

  RxList<PCateItemModel> pCateItemModels = <PCateItemModel>[].obs;
  final RxInt selectIndex = 0.obs;

  void changeSelectIndex(int index) {
    selectIndex.value = index;
    updatePCateItemModels();
    update();
  }

  void updatePCateItemModels() async {
    final Response response = await provider.getPCateModel(query: {"pid": state!.items?[selectIndex.value].id});
    if (response.hasError) {
      pCateItemModels.value = <PCateItemModel>[].obs;
    } else {
      pCateItemModels.value = response.body.items;
    }
    for (var element in pCateItemModels) {log(element.toString());}
    update();
  }

  getPCateModelData() async {
    final Response response = await provider.getPCateModel();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
      updatePCateItemModels();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPCateModelData();
  }
}
