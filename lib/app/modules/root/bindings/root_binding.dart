import 'package:get/get.dart';

import '../../../data/best_category_provider.dart';
import '../../../data/category_provider.dart';
import '../../../data/focus_provider.dart';
import '../../../data/goods_provider.dart';
import '../../cart/controllers/cart_controller.dart';
import '../../cart/controllers/cart_guess_controller.dart';
import '../../category/controllers/category_controller.dart';
import '../../give/controllers/give_controller.dart';
import '../../home/controllers/home_best_goods_banner_controller.dart';
import '../../home/controllers/home_best_goods_list_controller.dart';
import '../../home/controllers/home_category_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/controllers/home_hot_goods_list_controller.dart';
import '../../home/controllers/home_hot_goods_swiper_controller.dart';
import '../../home/controllers/home_swiper_controller.dart';
import '../../user/controllers/user_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());

    /*providers*/
    Get.lazyPut<IBestCategoryProvider>(() => BestCategoryProvider());
    Get.lazyPut<ICategoryProvider>(() => CategoryProvider());
    Get.lazyPut<IFocusProvider>(() => FocusProvider());
    Get.lazyPut<IGoodsProvider>(() => GoodsProvider());

    /*Home*/
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeSwiperController>(() => HomeSwiperController(provider: Get.find<IFocusProvider>()));
    Get.lazyPut<HomeCategoryController>(() => HomeCategoryController(provider: Get.find<IBestCategoryProvider>()));
    Get.lazyPut<HomeHotGoodsListController>(() => HomeHotGoodsListController(provider: Get.find<IGoodsProvider>()));
    Get.lazyPut<HomeHotGoodsSwiperController>(() => HomeHotGoodsSwiperController(provider: Get.find<IFocusProvider>()));
    Get.lazyPut<HomeBestGoodsBannerController>(() => HomeBestGoodsBannerController(provider: Get.find<IGoodsProvider>()));
    Get.lazyPut<HomeBestGoodsListController>(() => HomeBestGoodsListController(provider: Get.find<IGoodsProvider>()));

    /*Category*/
    Get.lazyPut<CategoryController>(() => CategoryController(provider: Get.find<ICategoryProvider>()));

    /*Cart*/
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<CartGuessController>(() => CartGuessController(provider: Get.find<IGoodsProvider>()));


    Get.lazyPut<GiveController>(() => GiveController());
    Get.lazyPut<UserController>(() => UserController());
  }
}
