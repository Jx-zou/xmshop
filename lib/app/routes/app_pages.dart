import 'package:get/get.dart';

import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.PRODUCT_DETAILS;

  static final routes = [
    GetPage(
        name: _Paths.ROOT,
        page: () => const RootView(),
        binding: RootBinding()),
    GetPage(
        name: _Paths.PRODUCT,
        page: () => const ProductView(),
        binding: ProductBinding()),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS,
      page: () => const ProductDetailsView(),
      binding: ProductDetailsBinding(),
    ),
  ];
}
