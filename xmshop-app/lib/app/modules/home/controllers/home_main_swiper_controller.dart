import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import '../../../data/focus_provider.dart';
import '../../../models/focus_model.dart';

class HomeMainSwiperController extends BaseController with StateMixin<List<FocusModel>> {
  final IFocusProvider provider;

  HomeMainSwiperController({required this.provider});

  @override
  void loadData() async {
    final response = await provider.getFocusModels();
    if (response.hasError) {
      change(null, status: RxStatus.error(response.statusText));
    } else if (response.body!.isEmpty) {
      change([], status: RxStatus.empty());
    } else {
      change(response.body, status: RxStatus.success());
    }
  }
}
