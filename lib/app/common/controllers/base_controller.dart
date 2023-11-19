import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  void init() {}
  void loadData() {}
  void close() {}
  void reset() {}

  Future<void> onRefresh({Duration duration = Duration.zero}) async {
    Future.delayed(duration, () {
      reset();
      close();
      init();
      loadData();
    });
  }

  @override
  void onInit() {
    super.onInit();
    init();
    loadData();
  }

  @override
  void onClose() {
    super.onClose();
    close();
  }
}
