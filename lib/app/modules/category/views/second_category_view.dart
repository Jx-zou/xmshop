import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/loading.dart';

import '../controllers/second_category_controller.dart';
import '../../../utils/screen_adapter.dart';

class SecondCategoryView extends GetView<SecondCategoryController> {
  const SecondCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => GridView.builder(
            itemCount: state?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: ScreenAdapter.width(40),
                childAspectRatio: 240 / 346),
            itemBuilder: (context, index) => InkWell(
                  onTap: controller.onTap("${state?[index].id}"),
                  child: Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Image.network(
                              "https://xiaomi.itying.com/${state?[index].pic}"
                                  .replaceAll("\\", "/"),
                              fit: BoxFit.fitHeight)),
                      SizedBox(height: ScreenAdapter.height(30)),
                      Text("${state?[index].title}")
                    ],
                  ),
                )),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
