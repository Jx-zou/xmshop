part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.ROOT;
  static const PRODUCT = _Paths.PRODUCT;
  static const SEARCH = _Paths.SEARCH;
  static const PRODUCT_DETAILS = _Paths.PRODUCT_DETAILS;
}

abstract class _Paths {
  _Paths._();
  static const ROOT = '/root';
  static const PRODUCT = '/product';
  static const SEARCH = '/search';
  static const PRODUCT_DETAILS = '/product-details';
}
