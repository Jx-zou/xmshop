import 'package:get/get.dart';

import '../../../common/controllers/base_controller.dart';
import '../../../services/search_service.dart';

class XmSearchController extends BaseController with StateMixin<List<String>> {

  final SearchService searchService = Get.find<SearchService>();

  RxString keywords = "".obs;

  onKeywordsTap(String value) {
    changeKeywords(value);
    searchToProduct();
  }

  changeKeywords(String value) {
    keywords.value = value;
    update();
  }

  searchToProduct() {
    searchService.setHistory(keywords.value);
    Get.offAndToNamed("/product", parameters: {
      "requestKey": "search",
      "requestValue": keywords.value
    });
  }

  void clearHistoryData() async {
    if (state != null && state!.isNotEmpty) {
      state?.clear();
      await searchService.clearHistory();
      update();
    }
  }

  void removeHistoryData(String keywords) async {
    if (state != null && state!.contains(keywords)) {
      state?.remove(keywords);
    }
    await searchService.deleteHistory(keywords);
    update();
  }

  @override
  void loadData() async {
    List<String>? history = await searchService.getHistory();
    if (history.isNotEmpty) {
      if (state == null) {
        change(history, status: RxStatus.success());
        return;
      }
      state?.addAll(history);
      change(history, status: RxStatus.success());
    }
  }
}
