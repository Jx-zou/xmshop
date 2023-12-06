import 'package:get/get.dart';

import 'storage_service.dart';

class SearchService extends GetxService{
  final String searchHistoryKey = "searchHistory";
  final StorageService storageService = Get.find<StorageService>();

  Future<bool> setHistory(keywords) async {
    List<String>? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty) {
      if(!searchHistory.contains(keywords)) {
        searchHistory.add(keywords);
        return await storageService.set(searchHistoryKey, searchHistory);
      }
      return false;
    }
    searchHistory = [];
    searchHistory.add(keywords);
    return await storageService.set(searchHistoryKey, searchHistory);
  }

  Future<List<String>?> getHistory() async {
    List<String>? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null) {
      return searchHistory;
    }
    return null;
  }

  Future<bool> deleteHistory(keywords) async {
    List<String>? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty && searchHistory.contains(keywords)) {
      searchHistory.remove(keywords);
      storageService.remove(searchHistoryKey);
      return await storageService.set(searchHistoryKey, searchHistory);
    }
    return false;
  }

  Future<bool> clearHistory() async {
    List<String>? searchHistory = await storageService.get(searchHistoryKey);
    if (searchHistory != null) {
      return await storageService.remove(searchHistoryKey);
    }
    return true;
  }
}