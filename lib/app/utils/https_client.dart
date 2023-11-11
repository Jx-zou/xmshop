import 'package:xmshop/global.dart';

class HttpsClient {

  static String picReplaceUrl(String url) {
    return "${Global.Server}$url".replaceAll("\\", "/");
  }
}