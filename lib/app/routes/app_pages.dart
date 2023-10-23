import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/category/bindings/category_binding.dart';
import '../modules/category/views/category_view.dart';
import '../modules/give/bindings/give_binding.dart';
import '../modules/give/views/give_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/root/views/root_view.dart';
import '../modules/root/views/root_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/user/views/user_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
        name: _Paths.ROOT,
        page: () => const RootView(),
        binding: RootBinding(),
        children: [

        ]),
  ];
}
