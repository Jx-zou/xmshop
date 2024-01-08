import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../../../icons/xm_shop_icons.dart';
import '../controllers/home_controller.dart';
import 'home_body_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _actionButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenAdapter.width(40),
      ),
      child: InkResponse(
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
        preferredSize: Size.fromHeight(ScreenAdapter.height(150)),
        child: Obx(
          () => AppBar(
            leadingWidth: 0,
            title: Container(
              alignment: Alignment.centerRight,
              child: Stack(alignment: AlignmentDirectional.centerStart, children: [
                Icon(XmShopIcons.logo, size: 32, color: Color.fromRGBO(255, 255, 255, 1 - controller.ratio.value)),
                InkResponse(
                    child: Container(
                      margin: EdgeInsets.only(left: ScreenAdapter.width((1 - controller.ratio.value) * controller.maxSize)),
                      width: ScreenAdapter.width(650 + controller.ratio.value * controller.maxSize),
                      height: ScreenAdapter.height(110),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(230, 240, 245, 245),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                                child: const Icon(XmShopIcons.search, size: 20, color: Colors.black26)),
                            Text(
                              "手机",
                              style: TextStyle(fontSize: ScreenAdapter.fontSize(32), color: Colors.black54),
                            ),
                          ]),
                    ),
                    onTap: () {
                      Get.toNamed("/search");
                    }),
              ]),
            ),
            backgroundColor: Color.fromRGBO(255, 255, 255, controller.ratio.value),
            elevation: 0,
            actions: [
              _actionButton(XmShopIcons.qrcode, () {}),
              _actionButton(XmShopIcons.message, () {}),
            ],
            actionsIconTheme: IconThemeData(
              size: ScreenAdapter.fontSize(64),
              color: controller.ratio.value == 1 ? Colors.black87 : Colors.white,
            ),
          ),
        ),
      ),
      body: const HomeBodyView(),
    );
  }
}
