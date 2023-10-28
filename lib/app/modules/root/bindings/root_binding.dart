import 'package:get/get.dart';
import 'package:xmshop/app/data/best_category_provider.dart';
import 'package:xmshop/app/data/focus_provider.dart';
import 'package:xmshop/app/data/goods_provider.dart';
import 'package:xmshop/app/data/pcate_provider.dart';
import 'package:xmshop/app/modules/cart/controllers/cart_controller.dart';
import 'package:xmshop/app/modules/category/controllers/category_controller.dart';
import 'package:xmshop/app/modules/give/controllers/give_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_hot_goods_list_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_hot_goods_swiper_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_category_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_best_goods_banner_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_best_goods_list_controller.dart';
import 'package:xmshop/app/modules/home/controllers/home_swiper_controller.dart';
import 'package:xmshop/app/modules/user/controllers/user_controller.dart';

import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());

    /*providers*/
    Get.lazyPut<IBestCategoryProvider>(() => BestCategoryProvider());
    Get.lazyPut<IPCateProvider>(() => PCateProvider());
    Get.lazyPut<IFocusProvider>(() => FocusProvider());
    Get.lazyPut<IGoodsProvider>(() => GoodsProvider(), fenix: true);

    /*Home*/
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeSwiperController>(() => HomeSwiperController(provider: Get.find<IFocusProvider>()));
    Get.lazyPut<HomeCategoryController>(() => HomeCategoryController(provider: Get.find<IBestCategoryProvider>()));
    Get.lazyPut<HomeHotGoodsListController>(() => HomeHotGoodsListController(provider: Get.find<IGoodsProvider>()));
    Get.lazyPut<HomeHotGoodsSwiperController>(() => HomeHotGoodsSwiperController(provider: Get.find<IFocusProvider>()));
    Get.lazyPut<HomeBestGoodsBannerController>(() => HomeBestGoodsBannerController(provider: Get.find<IGoodsProvider>()));
    Get.lazyPut<HomeBestGoodsListController>(() => HomeBestGoodsListController(provider: Get.find<IGoodsProvider>()));

    /*Category*/
    Get.lazyPut<CategoryController>(() => CategoryController(provider: Get.find<IPCateProvider>()));


    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<GiveController>(() => GiveController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
