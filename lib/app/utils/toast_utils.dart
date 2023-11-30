import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static centerToast(String msg) {
    Fluttertoast.showToast(msg: msg, webPosition: 'center');
  }
}