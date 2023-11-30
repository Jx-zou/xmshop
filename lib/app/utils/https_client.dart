import 'package:xmshop/config.dart';

class HttpsClient {

  static String picReplaceUrl(String url) {
    return "${Config.server}$url".replaceAll("\\", "/");
  }
}