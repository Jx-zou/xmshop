import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../category/views/category_view.dart';
import '../../give/views/give_view.dart';
import '../../home/views/home_view.dart';
import '../../user/views/user_view.dart';

class RootController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController(initialPage: 0);

  final List<String> bottomNavigationBarItems = [
    "首页"
  ];

  final List<Widget> pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView()
  ];

  void switchPage(int index) {
    currentIndex.value = index;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
