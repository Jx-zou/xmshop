import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../material/bubble_button.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../material/shape_button.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_body_view.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key});

  _action(VoidCallback onPressed, IconData icon, EdgeInsetsGeometry? margin) {
    return Container(
      margin: margin,
      alignment: Alignment.center,
      child: ShapeButton(
        onPressed: onPressed,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.width(80),
        color: Colors.black.withOpacity(
          0.3 * (1 - controller.appBarOpacity.value),
        ),
        shape: ContinuousRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ScreenAdapter.fontSize(54),
          ),
        ),
        child: Icon(icon,
            size: ScreenAdapter.width(40), color: controller.actionColor.value),
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
              leading: _action(() {
                Get.back();
              }, XmshopIcons.arrowLeft, null),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: controller.tannerTitles
                    .map(
                      (value) => InkWell(
                        onTap: () {
                          controller.onTarTitlePressed(value['id']);
                        },
                        child: Column(
                          children: [
                            SizedBox(
                              height: ScreenAdapter.height(20),
                            ),
                            Text(
                              value['title'],
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(35),
                                color:
                                    value['id'] == controller.selectedId.value
                                        ? Colors.red.withOpacity(
                                            controller.appBarOpacity.value)
                                        : Colors.black.withOpacity(
                                            controller.appBarOpacity.value),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                  top: ScreenAdapter.height(20),
                                ),
                                width: ScreenAdapter.width(50),
                                height: ScreenAdapter.height(5),
                                color:
                                    value['id'] == controller.selectedId.value
                                        ? Colors.red.withOpacity(
                                            controller.appBarOpacity.value)
                                        : Colors.transparent),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              centerTitle: true,
              backgroundColor:
                  Color.fromRGBO(255, 255, 255, controller.appBarOpacity.value),
              elevation: 0,
              actions: [
                _action(
                  () {},
                  XmshopIcons.share,
                  EdgeInsets.only(
                    right: ScreenAdapter.width(40),
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
                                padding: 0 == index
                                    ? EdgeInsets.zero
                                    : EdgeInsets.only(
                                        top: ScreenAdapter.height(30)),
                                child: Row(children: [
                                  Icon(
                                    controller.moreMenu[index]['icon'],
                                    size: ScreenAdapter.fontSize(48),
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: ScreenAdapter.width(30),
                                  ),
                                  Text(
                                    controller.moreMenu[index]['title'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenAdapter.fontSize(38)),
                                  ),
                                ]),
                              ),
                            );
                          }),
                  ),
                  child: Material(
                    color: Colors.black.withOpacity(
                      0.3 * (1 - controller.appBarOpacity.value),
                    ),
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        ScreenAdapter.fontSize(54),
                      ),
                    ),
                    child: SizedBox(
                      width: ScreenAdapter.width(80),
                      height: ScreenAdapter.width(80),
                      child: Icon(XmshopIcons.more,
                          size: ScreenAdapter.width(40),
                          color: controller.actionColor.value),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenAdapter.width(40),
                )
              ]),
        ),
      ),
      body: ProductDetailsBodyView(),
    );
  }
}
