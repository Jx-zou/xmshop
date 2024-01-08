import 'package:get/get.dart';

import '../../../controllers/base_controller.dart';
import 'xm_search_controller.dart';

class SearchGuessController extends BaseController with StateMixin<List<String>> {

  final XmSearchController searchController = Get.find<XmSearchController>();

  @override
  void loadData() {
    change(["手机", "电脑", "女装"], status: RxStatus.success());
  }
}