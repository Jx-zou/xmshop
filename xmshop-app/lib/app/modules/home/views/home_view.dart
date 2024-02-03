import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_controller.dart';
import 'home_body_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _action(String image, String changedImage, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.only(right: ScreenAdapter.width(40)),
      child: InkResponse(
        onTap: onPressed,
        child: Image.asset(
          controller.ratio.value == 1 ? "assets/images/$image" : "assets/images/$changedImage",
          width: ScreenAdapter.fontSize(60),
          height: ScreenAdapter.fontSize(60),
        ),
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
                child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Icon(
                        XmIcons.logo,
                        size: ScreenAdapter.fontSize(60),
                        color: Color.fromRGBO(255, 255, 255, 1 - controller.ratio.value),
                      ),
                      InkResponse(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: ScreenAdapter.width((1 - controller.ratio.value) * controller.maxSize),
                            ),
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
                                    padding: EdgeInsets.only(left: ScreenAdapter.width(32)),
                                    child: Icon(
                                      XmIcons.search,
                                      size: ScreenAdapter.fontSize(60),
                                      color: Colors.black26,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: ScreenAdapter.width(12)),
                                    child: Text(
                                      "手机",
                                      style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(32),
                                        color: Colors.black38,
                                      ),
                                    ),
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
                _action("qrcode.png", "white_qrcode.png", () {}),
                _action("message.png", "white_message.png", () {}),
              ]),
        ),
      ),
      body: const HomeBodyView(),
    );
  }
}
