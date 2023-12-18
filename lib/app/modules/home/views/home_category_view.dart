import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/button/label_button.dart';
import '../../../views/status/loading_view.dart';
import '../controllers/home_category_controller.dart';

class HomeCategoryView extends GetView<HomeCategoryController> {
  const HomeCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        color: Colors.white,
        height: ScreenAdapter.height(590),
        padding: EdgeInsets.only(
          top: ScreenAdapter.height(80),
        ),
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(
              bottom: ScreenAdapter.height(30),
            ),
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
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Obx(
                () => SizedBox(
                  width: 65.0,
                  height: 3.0,
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black26,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    value: controller.paginationValue.value,
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
      onLoading: LoadingView.circle(),
      onEmpty: Container(),
      onError: (error) => Container(),
    );
  }
}
