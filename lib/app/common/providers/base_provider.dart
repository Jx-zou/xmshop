import 'package:get/get_connect/connect.dart';
import 'package:xmshop/global.dart';

class BaseProvider extends GetConnect {

  @override
  void onInit() {
    //请求前缀
    httpClient.baseUrl = Global.ServerApi;

    //request监听
    httpClient.addResponseModifier((request, response) {
      print(request.url.toString());
      return response;
    });
    
    super.onInit();
  }



}