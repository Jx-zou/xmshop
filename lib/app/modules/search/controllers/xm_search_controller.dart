import 'package:get/get.dart';
import '../../../services/search_service.dart';

class XmSearchController extends GetxController {

  final SearchService searchService = Get.find<SearchService>();

  String keywords = "";
  RxList history = [].obs;

  searchToProduct() {
    searchService.setHistory(keywords);
    Get.offAndToNamed("/product", parameters: {
      "requestKey": "search",
      "requestValue": keywords
    });
  }

  void clearHistoryData() async {
    if (history.isNotEmpty) {
      history.clear();
      await searchService.clearHistory();
      update();
    }
  }

  void removeHistoryData(String keywords) async {
    if (history.contains(keywords)) {
      history.remove(keywords);
    }
    await searchService.deleteHistory(keywords);
    update();
  }

  _getHistoryData() async {
    List? history = await searchService.getHistory();
    if (history.isNotEmpty) {
      this.history.addAll(history);
      update();
    }  
  }

  @override
  void onInit() {
    super.onInit();
    _getHistoryData();
  }

  
}
