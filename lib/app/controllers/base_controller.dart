import 'package:get/get.dart';

const Duration refreshDuration = Duration(seconds: 3);

abstract class BaseController extends GetxController {
  void init() {}

  void loadData() {}

  void close() {}

  void reset() {}

  Future<void> onRefresh({Duration? duration}) async {
    await Future.delayed(duration ?? refreshDuration, () {
      reset();
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
    close();
    super.onClose();
  }
}
