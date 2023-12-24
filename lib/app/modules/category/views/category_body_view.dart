import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../views/status/error_view.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../common/utils/screen_adapter.dart';
import '../controllers/category_controller.dart';
import 'category_second_view.dart';

class CategoryBodyView extends GetView<CategoryController> {
  const CategoryBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: controller.obx(
        (state) => Row(children: [
          SizedBox(
            width: ScreenAdapter.width(300),
            height: double.infinity,
            child: ListView.builder(
              itemCount: state?.length,
              itemBuilder: (context, index) => SizedBox(
                width: double.infinity,
                height: ScreenAdapter.height(180),
                child: InkWell(
                  onTap: () => controller.changeSelectIndex(index),
                  child: Stack(children: [
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
                  ]),
                ),
              ),
            ),
          ),
          const Expanded(
            child: CategorySecondView(),
          )
        ]),
        onLoading: LoadingView.circle(),
        onEmpty: const EmptyView(),
        onError: (error) => const ErrorView(),
      ),
    );
  }
}
