
import '../utils/storage.dart';

class SearchService {

  static const String searchHistoryKey = "searchHistory";

  static setHistory(keywords) async {
    List? searchHistory = await Storage.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty) {
      if(!searchHistory.contains(keywords)) {
        searchHistory.add(keywords);
        await Storage.set(searchHistoryKey, searchHistory);
      }
      return;
    }
    searchHistory = [];
    searchHistory.add(keywords);
    await Storage.set(searchHistoryKey, searchHistory);
  }

  static getHistory() async {
    List? searchHistory = await Storage.get(searchHistoryKey);
    if (searchHistory != null) {
      return searchHistory;
    }
    return [];
  }

  static deleteHistory(keywords) async {
    List? searchHistory = await Storage.get(searchHistoryKey);
    if (searchHistory != null && searchHistory.isNotEmpty && searchHistory.contains(keywords)) {
      Storage.remove(searchHistoryKey);
      await Storage.set(searchHistoryKey, searchHistory);
    }
  }

  static clearHistory() async {
    List? searchHistory = await Storage.get(searchHistoryKey);
    if (searchHistory != null) {
      Storage.remove(searchHistoryKey);
    }
  }
}