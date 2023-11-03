
import 'package:get/get.dart';

import 'storage_service.dart';

class SearchService extends GetxService{

  static const String searchHistoryKey = "searchHistory";

  final StorageService storageService = Get.find<StorageService>();

  setHistory(keywords) async {
    List? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty) {
      if(!searchHistory.contains(keywords)) {
        searchHistory.add(keywords);
        await storageService.set(searchHistoryKey, searchHistory);
      }
      return;
    }
    searchHistory = [];
    searchHistory.add(keywords);
    await storageService.set(searchHistoryKey, searchHistory);
  }

  Future<List> getHistory() async {
    List? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null) {
      return searchHistory;
    }
    return [];
  }

  deleteHistory(keywords) async {
    List? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty && searchHistory.contains(keywords)) {
      storageService.remove(searchHistoryKey);
      await storageService.set(searchHistoryKey, searchHistory);
    }
  }

  clearHistory() async {
    List? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null) {
      storageService.remove(searchHistoryKey);
    }
  }
}