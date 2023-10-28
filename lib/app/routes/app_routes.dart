part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.ROOT;
  static const PRODUCT =_Paths.PRODUCT;
}

abstract class _Paths {
  _Paths._();
  static const ROOT = '/root';
  static const PRODUCT = '/product';
}
