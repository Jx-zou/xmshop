import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/button/bubble_button.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_body_view.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  Widget _action(String uri, String changedUri) {
    return Image.asset(
      controller.ratio.value == 1 ? "assets/images/$changedUri" : "assets/images/$uri",
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.width(80),
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
              leading: InkResponse(
                onTap: () {
                  Get.back();
                },
                child: _action("arrow_left_circle_gray.png", "arrow_left_black.png"),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.tannerTitles
                    .map(
                      (value) => InkResponse(
                        onTap: () {
                          controller.onTarTitlePressed(value['id']);
                        },
                        child: Column(
                          children: [
                            SizedBox(height: ScreenAdapter.height(20)),
                            Text(
                              value['title'],
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(35),
                                color: value['id'] == controller.selectedId.value ? Colors.red.withOpacity(controller.ratio.value)
                                    : Colors.black.withOpacity(controller.ratio.value),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: ScreenAdapter.height(20)),
                                width: ScreenAdapter.width(50),
                                height: ScreenAdapter.height(5),
                                color: value['id'] == controller.selectedId.value ? Colors.red.withOpacity(controller.ratio.value)
                                        : Colors.transparent)
                          ]),
                      ),
                    )
                    .toList(),
              ),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, controller.ratio.value),
              elevation: 0,
              actions: [
                InkResponse(
                  onTap: () {},
                  child: _action(
                    "share_circle_gray.png",
                    "share_black.png",
                  ),
                ),
                BubbleButton(
                  arrowWidth: 20,
                  arrowHeight: 10,
                  offset: const Offset(0, 10),
                  popupChild: SizedBox(
                    width: 150,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(ScreenAdapter.height(50)),
                        shrinkWrap: true,
                        itemCount: controller.moreMenu.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkResponse(
                            onTap: () {},
                            child: Padding(
                              padding: 0 == index ? EdgeInsets.zero : EdgeInsets.only(top: ScreenAdapter.height(30)),
                              child: Row(children: [
                                Icon(controller.moreMenu[index]['icon'],
                                    size: ScreenAdapter.fontSize(48),
                                    color: Colors.white),
                                SizedBox(width: ScreenAdapter.width(30)),
                                Text(
                                  controller.moreMenu[index]['title'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ScreenAdapter.fontSize(38),
                                  ),
                                ),
                              ]),
                            ),
                          );
                        }),
                  ),
                  child: _action("more_circle_gray.png", "more_black.png"),
                ),
                SizedBox(width: ScreenAdapter.width(40)),
              ]),
        ),
      ),
      body: const ProductDetailsBodyView(),
    );
  }
}
