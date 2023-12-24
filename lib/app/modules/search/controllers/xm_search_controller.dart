import 'package:get/get.dart';
import 'package:xmshop/app/common/utils/routes.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../services/search_service.dart';

class XmSearchController extends BaseController with StateMixin<List<String>> {
  final SearchService searchService = Get.find<SearchService>();

  RxString keywords = "".obs;

  void search({String? value}) {
    if (value != null) {
      changeKeywords(value);
    }
    saveSearchHistory();
    Routes.toProduct(keywords: keywords.value, type: RouteType.off);
  }

  void changeKeywords(String value) {
    keywords.value = value;
    update();
  }

  void saveSearchHistory() {
    searchService.setHistory(keywords.value);
  }

  void clearHistoryData() {
    if (state != null && state!.isNotEmpty) {
      state?.clear();
      searchService.clearHistory();
      update();
    }
  }

  void removeHistoryData(String keywords) {
    if (state != null && state!.contains(keywords)) {
      state?.remove(keywords);
    }
    searchService.deleteHistory(keywords);
    update();
  }

  @override
  void loadData() async {
    printInfo(info: "读取搜索历史数据.");
    List<String>? history = await searchService.getHistory();
    if(history == null || history.isEmpty) {
      change(history, status: RxStatus.empty());
    } else {
      change(history, status: RxStatus.success());
    }
  }
}