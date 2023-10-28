import 'package:get/get.dart';
import 'package:xmshop/app/modules/product/bindings/product_binding.dart';
import 'package:xmshop/app/modules/product/views/product_view.dart';

import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
        name: _Paths.ROOT,
        page: () => const RootView(),
        binding: RootBinding()),
    GetPage(
        name: _Paths.PRODUCT,
        page: () => const ProductView(),
        binding: ProductBinding())
  ];
}
