import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/home_category_controller.dart';

class HomeCategoryView extends GetView<HomeCategoryController> {
  const HomeCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: ScreenAdapter.height(470),
          child: controller.obx(
            (state) => GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state?.length,
                controller: controller.scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ScreenAdapter.width(5),
                    crossAxisSpacing: ScreenAdapter.height(20)),
                itemBuilder: (context, index) => Column(children: [
                      Container(
                        alignment: Alignment.center,
                        width: ScreenAdapter.width(120),
                        height: ScreenAdapter.width(120),
                        child: Image.network(
                            "https://xiaomi.itying.com/${state?[index].pic}"
                                .replaceAll('\\', '/'),
                            fit: BoxFit.cover),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text("${state?[index].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34)))),
                    ])),
            onLoading: const Loading(),
            onEmpty: Container(),
            onError: (error) => Container(),
          )),
      Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Center(
              child: Obx(() => SizedBox(
                  width: 65.0,
                  height: 3.0,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black26,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    value: controller.paginationValue.value,
                  )))))
    ]);
  }
}
