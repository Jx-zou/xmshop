import 'package:get/get.dart';

import '../../../data/focus_provider.dart';
import '../../../models/focus_model.dart';

class HomeHotGoodsSwiperController extends GetxController with StateMixin<List<FocusModel>> {

  final IFocusProvider provider;

  HomeHotGoodsSwiperController({required this.provider});


  _getFocusData() async {
    final response = await provider.getFocusModel(query: {"position": "2"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else {
      change(response.body, status: RxStatus.success());
    }
  }

  @override
  void onInit() {
    super.onInit();
    _getFocusData();
  }
}