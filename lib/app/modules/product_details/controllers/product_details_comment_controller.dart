import 'package:get/get.dart';
import '../../../common/controllers/base_controller.dart';

class ProductDetailsCommentController extends BaseController with StateMixin<String> {

  final List<String> picList = [
    "https://p4.itc.cn/images01/20211031/d0ff5fcb10e240928bc0ec46b8d71fbf.jpeg",
    "https://files.jb51.net/file_images/article/201407/20140730091343112.jpg",
    "https://k-static.appmobile.cn/uploads/allimg/211207/28-21120G43118.jpg",
    "https://img1.mydrivers.com/img/20220927/d35930cd-b2d6-4a59-a11d-1ecc4c163c47_1000.jpg"
  ];

  @override
  void loadData() {
    // TODO: implement loadData
    super.loadData();
  }
}