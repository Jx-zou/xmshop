import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../data/focus_provider.dart';
import '../../../models/focus_model.dart';

class HomeHotGoodsSwiperController extends BaseController
    with StateMixin<List<FocusModel>> {
  final IFocusProvider provider;

  HomeHotGoodsSwiperController({required this.provider});

  @override
  void loadData() async {
    final response = await provider.getFocusModels(query: {"position": "2"});
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
      return;
    }
    change(response.body, status: RxStatus.success());
  }
}
