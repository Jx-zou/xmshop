import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: (index) => controller.switchPage(index),
            itemCount: controller.pages.length,
            itemBuilder: (context, index) => controller.pages[index]),
        bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            currentIndex: controller.currentIndex.value,
            selectedFontSize: ScreenAdapter.fontSize(32),
            unselectedFontSize: ScreenAdapter.fontSize(32),
            type: BottomNavigationBarType.fixed,
            iconSize: ScreenAdapter.fontSize(56),
            unselectedItemColor: Colors.black,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            onTap: (index) {
              controller.switchPage(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(XmIcons.rootHome), label: "首页"),
              BottomNavigationBarItem(icon: Icon(XmIcons.rootCategory), label: "分类"),
              BottomNavigationBarItem(icon: Icon(XmIcons.rootService), label: "服务"),
              BottomNavigationBarItem(icon: Icon(XmIcons.rootCart), label: "购物车"),
              BottomNavigationBarItem(icon: Icon(XmIcons.rootUser), label: "用户")
            ]),
      ),
    );
  }
}
