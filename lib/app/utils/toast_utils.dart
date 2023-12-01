import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  ToastUtils._();

  static centerToast(String msg) {
    Fluttertoast.showToast(msg: msg, webPosition: 'center');
  }
}