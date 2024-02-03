import '../../../config.dart';

class HttpsClient {
  HttpsClient._();

  static String picReplaceUrl(String url) {
    return "${Config.server}$url".replaceAll("\\", "/");
  }
}