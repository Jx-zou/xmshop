import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/cart/views/cart_view.dart';
import 'package:xmshop/app/modules/category/views/category_view.dart';
import 'package:xmshop/app/modules/give/views/give_view.dart';
import 'package:xmshop/app/modules/home/views/home_view.dart';
import 'package:xmshop/app/modules/user/views/user_view.dart';

class RootController extends GetxController {
  final RxInt currentIndex = 1.obs;
  final PageController pageController = PageController(initialPage: 1);
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
