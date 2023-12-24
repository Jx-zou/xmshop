import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/routes.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/empty_view.dart';
import '../controllers/category_second_controller.dart';

class CategorySecondView extends GetView<CategorySecondController> {
  const CategorySecondView({super.key});

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
            Routes.toProduct(cid: state?[index].id, type: RouteType.off);
          },
          child: Column(children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Image.network(
                  HttpsClient.picReplaceUrl("${state?[index].pic}"),
                  fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: ScreenAdapter.height(30),
            ),
            Text("${state?[index].title}")
          ]),
        ),
      ),
      onLoading: LoadingView.circle(),
      onEmpty: const EmptyView(),
      onError: (error) => const ErrorView(),
    );
  }
}
