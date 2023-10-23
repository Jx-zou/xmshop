import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              onPageChanged: (index) => controller.switchPage(index),
              itemCount: controller.pages.length,
              itemBuilder: (context, index) => controller.pages[index]),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.switchPage(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
              BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.room_service), label: "服务"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "用户")
            ],
          ),
        ));
  }
}
