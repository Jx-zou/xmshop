import 'package:get/get.dart';

import '../../../config.dart';

abstract class BaseProvider extends GetConnect {

  @override
  void onInit() {
    //请求前缀
    httpClient.baseUrl = Config.serverApi;

    //request监听
    httpClient.addResponseModifier((request, response) {
      printInfo(info: request.url.toString());
      return response;
    });
    
    super.onInit();
  }
}