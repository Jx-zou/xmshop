import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import 'xm_search_controller.dart';

class SearchGuessController extends BaseController with StateMixin<List<String>> {

  final XmSearchController searchController = Get.find<XmSearchController>();

  void onKeywordsTap(String value) {
    searchController.onKeywordsTap(value);
  }

  @override
  void loadData() {
    change(["手机", "电脑", "女装"], status: RxStatus.success());
  }
}