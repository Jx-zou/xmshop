import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/views/search_history_view.dart';

import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/xm_search_controller.dart';
import 'search_guess_view.dart';
import 'search_hot_view.dart';

class SearchBodyView extends GetView<XmSearchController> {
  const SearchBodyView({super.key});

  Widget _clearHistoryBottomSheet() {
    return controller.obx((state) => state!.isNotEmpty
        ? Container(
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(80),
            ScreenAdapter.height(50), ScreenAdapter.width(80), 0),
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(360),
        color: Colors.white,
        child: Column(children: [
          Center(
            child: Text(
              "您确定要清除历史记录吗？",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(42)),
            ),
          ),
          SizedBox(height: ScreenAdapter.height(40)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                width: ScreenAdapter.width(420),
                child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black12),
                        foregroundColor:
                        MaterialStateProperty.all(Colors.white)),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("取消",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(28),
                            color: Colors.black54)))),
            SizedBox(
              width: ScreenAdapter.width(420),
              child: ElevatedButton(
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.red),
                      foregroundColor:
                      MaterialStateProperty.all(Colors.white30)),
                  onPressed: () {
                    controller.clearHistoryData();
                    Get.back();
                  },
                  child: Text("确定",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(28),
                          color: Colors.black54))),
            )
          ])
        ]))
        : Container());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          TitleBanner("搜索历史",
              leftSize: ScreenAdapter.fontSize(48),
              iconSize: ScreenAdapter.fontSize(54),
              icon: Icons.delete, onTap: () {
                Get.bottomSheet(_clearHistoryBottomSheet());
              }),
          SizedBox(height: ScreenAdapter.height(30)),
          const SearchHistoryView(),
          SizedBox(height: ScreenAdapter.height(30)),
          TitleBanner("猜你想搜",
              leftSize: ScreenAdapter.fontSize(48),
              iconSize: ScreenAdapter.fontSize(60),
              icon: Icons.refresh),
          SizedBox(height: ScreenAdapter.height(30)),
          const SearchGuessView(),
          SizedBox(height: ScreenAdapter.height(30)),
          const SearchHotView()
        ]
    );
  }
}