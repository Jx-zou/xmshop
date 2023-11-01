import 'package:get/get.dart';
import '../../../services/search_service.dart';

class XmSearchController extends GetxController {

  String keywords = "";
  RxList history = [].obs;

  searchToProduct() {
    SearchService.setHistory(keywords);
    Get.offAndToNamed("/product", parameters: {
      "requestKey": "search",
      "requestValue": keywords
    });
  }

  void clearHistoryData() async {
    if (history.isNotEmpty) {
      history.clear();
      await SearchService.clearHistory();
      update();
    }
  }

  void removeHistoryData(String keywords) async {
    if (history.contains(keywords)) {
      history.remove(keywords);
    }
    await SearchService.deleteHistory(keywords);
    update();
  }

  _getHistoryData() async {
    List? history = await SearchService.getHistory();
    if (history != null && history.isNotEmpty) {
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
