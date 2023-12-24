import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../controllers/search_hot_controller.dart';

class SearchHotView extends GetView<SearchHotController> {
  const SearchHotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenAdapter.height(80),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: ScreenAdapter.height(138),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/hot_search.png"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(10),
              0,
              ScreenAdapter.width(10),
              ScreenAdapter.width(80),
            ),
            child: controller.obx(
              (state) => GridView.builder(
                itemCount: state?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ScreenAdapter.width(40),
                    mainAxisSpacing: ScreenAdapter.height(20),
                    childAspectRatio: 3 / 1),
                itemBuilder: (context, index) => ListTile(
                    leading: Image.network(
                        HttpsClient.picReplaceUrl("${state?[index].pic}"),
                        fit: BoxFit.cover),
                    title: Text(
                      "${state?[index].title}",
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(32),
                          overflow: TextOverflow.ellipsis),
                    ),
                    onTap: () {
                      Get.offAndToNamed("product-details", parameters: {
                        "requestKey": "id",
                        "requestValue": "${state?[index].id}"
                      });
                    }),
              ),
              onLoading: LoadingView.circle(),
              onEmpty: const EmptyView(),
              onError: (error) => const ErrorView(),
            ),
          ),
        ],
      ),
    );
  }
}
