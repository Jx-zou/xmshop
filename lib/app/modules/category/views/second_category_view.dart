import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/status/loading_view.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/second_category_controller.dart';

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
                onTap: () {
                  controller.toProduct(state?[index].id);
                },
                child: Column(children: [
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.network(
                          HttpsClient.picReplaceUrl("${state?[index].pic}"),
                          fit: BoxFit.fitHeight)),
                  SizedBox(height: ScreenAdapter.height(30)),
                  Text("${state?[index].title}")
                ]))),
        onLoading: LoadingView.circle(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
