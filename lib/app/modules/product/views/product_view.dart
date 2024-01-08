import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_shop_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_controller.dart';
import 'product_body_view.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: Drawer(
        child: Container(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(40),
            ScreenAdapter.height(200),
            ScreenAdapter.width(40),
            ScreenAdapter.width(40),
          ),
          child: const Text("endDrawer..."),
        ),
      ),
      appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Container(
            width: ScreenAdapter.width(850),
            height: ScreenAdapter.height(100),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 244, 244),
              borderRadius: BorderRadius.circular(30),
            ),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenAdapter.width(34),
                  right: ScreenAdapter.width(10),
                ),
                child: const Icon(XmShopIcons.search,
                    size: 20, color: Colors.black45),
              ),
              Text(
                "${Get.parameters['requestValue']}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    color: Colors.black54),
              )
            ]),
          ),
          actions: const [Text("")]),
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: const ProductBodyView(),
    );
  }
}
