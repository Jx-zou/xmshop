import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/root_controller.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../common/icons/xmshop_icons.dart';

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
          selectedFontSize: 12.0,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.switchPage(index);
            controller.pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  XmshopIcons.home,
                  size: ScreenAdapter.fontSize(56),
                ),
                label: "首页"),
            BottomNavigationBarItem(
                icon: Icon(
                  XmshopIcons.category,
                  size: ScreenAdapter.fontSize(48),
                ),
                label: "分类"),
            BottomNavigationBarItem(
                icon: Icon(
                  XmshopIcons.service,
                  size: ScreenAdapter.fontSize(56),
                ),
                label: "服务"),
            BottomNavigationBarItem(
                icon: Icon(
                  XmshopIcons.tabShopCart,
                  size: ScreenAdapter.fontSize(56),
                ),
                label: "购物车"),
            BottomNavigationBarItem(
                icon: Icon(
                  XmshopIcons.mine,
                  size: ScreenAdapter.fontSize(56),
                ),
                label: "用户")
          ],
        ),
      ),
    );
  }
}
