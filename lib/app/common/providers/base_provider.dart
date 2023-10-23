import 'package:get/get_connect/connect.dart';
import 'package:xmshop/global.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Global.ServerApi;
    super.onInit();
  }



}