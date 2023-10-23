import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/loading.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/home_category_controller.dart';

class HomeCategoryView extends GetView<HomeCategoryController> {
  const HomeCategoryView({super.key});

  Widget _errorCategoryGridView() {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 1,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: ScreenAdapter.width(20),
            crossAxisSpacing: ScreenAdapter.height(20)),
        itemBuilder: (context, index) => Column(children: [
              Container(
                alignment: Alignment.center,
                width: ScreenAdapter.width(140),
                height: ScreenAdapter.width(140),
                child:
                    Image.asset("assets/images/404mix.jpg", fit: BoxFit.cover),
              ),
              Padding(
                  padding:
                      EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0),
                  child: Text("未",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(34)))),
            ]));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
          height: ScreenAdapter.height(470),
          child: controller.obx(
            (state) => GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state!.items?.length,
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
                            "https://xiaomi.itying.com/${state.items?[index].pic}"
                                .replaceAll('\\', '/'),
                            fit: BoxFit.cover),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, ScreenAdapter.height(4), 0, 0),
                          child: Text("${state.items?[index].title}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(34)))),
                    ])),
            onLoading: const Loading(),
            onEmpty: _errorCategoryGridView(),
            onError: (error) => _errorCategoryGridView(),
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
