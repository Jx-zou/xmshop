import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../utils/screen_adapter.dart';
import 'category_body_view.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: InkWell(
            child: Container(
              width: ScreenAdapter.width(840),
              height: ScreenAdapter.height(100),
              decoration: BoxDecoration(
                color: const Color.fromARGB(230, 240, 245, 245),
                borderRadius: BorderRadius.circular(30),
              ),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(XmshopIcons.search,
                      size: 20, color: Colors.black45),
                ),
                Text(
                  "搜索",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                      color: Colors.black54),
                )
              ]),
            ),
            onTap: () {
              Get.toNamed("/search");
            }),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(XmshopIcons.message),
            ),
          )
        ],
        actionsIconTheme: const IconThemeData(size: 25, color: Colors.black),
      ),
      body: const CategoryBodyView(),
    );
  }
}
