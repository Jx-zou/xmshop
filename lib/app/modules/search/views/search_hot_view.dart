import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/loading.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/search_hot_controller.dart';

class SearchHotView extends GetView<SearchHotController> {
  const SearchHotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenAdapter.height(138),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/hot_search.png"))),
          ),
          Container(
              padding: EdgeInsets.all(ScreenAdapter.width(10)),
              child: controller.obx(
                  (state) => GridView.builder(
                      itemCount: state?.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: ScreenAdapter.width(40),
                          mainAxisSpacing: ScreenAdapter.height(20),
                          childAspectRatio: 3 / 1),
                      itemBuilder: (context, index) => ListTile(
                            leading: Image.network("${state?[index].pic}",
                                fit: BoxFit.cover),
                            title: Text("${state?[index].title}"),
                            subtitle: Text("${state?[index].subTitle}"),
                        onTap: controller.onHotTap(state?[index].id),
                          )),
                  onLoading: const Loading(),
                  onEmpty: Container(),
                  onError: (error) => Container())),
          SizedBox(height: ScreenAdapter.height(20))
        ],
      ),
    );
  }
}
