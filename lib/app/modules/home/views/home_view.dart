import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_body_view.dart';
import '../controllers/home_controller.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../utils/screen_adapter.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _actionButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenAdapter.width(40),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Icon(icon),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          ScreenAdapter.height(150),
        ),
        child: Obx(
          () => AppBar(
            leadingWidth: 0,
            title: Container(
              alignment: Alignment.centerRight,
              child: Stack(
                  fit: StackFit.passthrough,
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Icon(XmshopIcons.logo,
                        color: Color.fromRGBO(
                            255, 255, 255, 1 - controller.ratio.value),
                        size: 32),
                    InkWell(
                        child: Container(
                          margin: EdgeInsets.only(
                            left: ScreenAdapter.width(
                                (1 - controller.ratio.value) *
                                    HomeController.maxOffset),
                          ),
                          width: ScreenAdapter.width(650 +
                              controller.ratio.value *
                                  HomeController.maxOffset),
                          height: ScreenAdapter.height(110),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(230, 240, 245, 245),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      ScreenAdapter.width(34),
                                      0,
                                      ScreenAdapter.width(10),
                                      0),
                                  child: const Icon(XmshopIcons.search,
                                      size: 20, color: Colors.black26),
                                ),
                                Text(
                                  "手机",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(32),
                                      color: Colors.black54),
                                )
                              ]),
                        ),
                        onTap: () {
                          Get.toNamed("/search");
                        })
                  ]),
            ),
            backgroundColor:
                Color.fromRGBO(255, 255, 255, controller.ratio.value),
            elevation: 0,
            actions: [
              _actionButton(XmshopIcons.qrcode, () {}),
              _actionButton(XmshopIcons.message, () {})
            ],
            actionsIconTheme: IconThemeData(
                size: ScreenAdapter.fontSize(64),
                color: controller.actionColor.value),
          ),
        ),
      ),
      body: const HomeBodyView(),
    );
  }
}
