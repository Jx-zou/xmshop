import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  _body() => Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(300),
            height: double.infinity,
            child: controller.obx((state) => ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) => SizedBox(
                    width: double.infinity,
                    height: ScreenAdapter.height(180),
                    child: InkWell(
                      onTap: () => controller.changeSelectIndex(index),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: ScreenAdapter.width(10),
                              height: ScreenAdapter.height(46),
                              color: controller.selectIndex.value == index
                                  ? Colors.deepOrange
                                  : Colors.white,
                            ),
                          ),
                          Center(
                            child: Text("${state?[index].title}"),
                          )
                        ],
                      ),
                    )))),
          ),
          Expanded(
              child: SizedBox(
            height: double.infinity,
            child: Obx(() => GridView.builder(
                itemCount: controller.categoryModels.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: ScreenAdapter.width(40),
                    childAspectRatio: 240 / 346),
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.offAndToNamed("/product", parameters: {
                          "requestKey": "cid",
                          "requestValue": "${controller.categoryModels[index].id}"
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Image.network(
                                  "https://xiaomi.itying.com/${controller.categoryModels[index].pic}"
                                      .replaceAll("\\", "/"),
                                  fit: BoxFit.fitHeight)),
                          SizedBox(height: ScreenAdapter.height(30)),
                          Text("${controller.categoryModels[index].title}")
                        ],
                      ),
                    ))),
          ))
        ],
      );

  _appBar() => AppBar(
      titleSpacing: 0,
      title: InkWell(
        child: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(100),
          decoration: BoxDecoration(
              color: const Color.fromARGB(230, 240, 245, 245),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(34), 0, ScreenAdapter.width(10), 0),
                  child: const Icon(XmshopIcons.search,
                      size: 20, color: Colors.black45)),
              Text(
                "搜索",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32), color: Colors.black54),
              )
            ],
          ),
        ),
        onTap: () {
          Get.toNamed("/xm-search");
        },
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [
        Padding(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(30), right: ScreenAdapter.width(30)),
            child: IconButton(
                onPressed: () {}, icon: const Icon(XmshopIcons.message)))
      ],
      actionsIconTheme: const IconThemeData(size: 25, color: Colors.black));

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _appBar(), body: _body());
  }
}
