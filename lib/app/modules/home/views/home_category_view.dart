import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/button/label_button.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../controllers/home_category_controller.dart';

class HomeCategoryView extends GetView<HomeCategoryController> {
  const HomeCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Column(children: [
        SizedBox(
          height: ScreenAdapter.height(470),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state?.length,
            controller: controller.scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: ScreenAdapter.width(5),
                crossAxisSpacing: ScreenAdapter.height(20),
                childAspectRatio: 1 / 1),
            itemBuilder: (context, index) => LabelButton(
              onPressed: () {},
              widget: Image.network(
                  HttpsClient.picReplaceUrl("${state?[index].pic}"),
                  width: ScreenAdapter.width(150),
                  height: ScreenAdapter.width(150),
                  fit: BoxFit.fitWidth),
              label: "${state?[index].title}",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(34),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(30)),
          child: SizedBox(
            width: 65.0,
            height: 3.0,
            child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(2),
                backgroundColor: Colors.black26,
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                value: controller.paginationValue.value),
          ),
        ),
      ]),
      onLoading: const LoadingView(),
          onEmpty: const EmptyView(),
          onError: (error) => const ErrorView(),
    );
  }
}
