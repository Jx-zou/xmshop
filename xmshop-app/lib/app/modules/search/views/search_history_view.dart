import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/title_banner.dart';
import '../controllers/xm_search_controller.dart';

class SearchHistoryView extends GetView<XmSearchController> {
  const SearchHistoryView({super.key});

  Widget _clearHistoryBottomSheet() {
    return controller.obx(
      (state) => Container(
        padding: EdgeInsets.all(
          ScreenAdapter.width(30),
        ),
        color: Colors.white,
        child: Column(children: [
          Center(
            child: Text(
              "您确定要清除历史记录吗？",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
              ),
            ),
          ),
          SizedBox(
            height: ScreenAdapter.height(40),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: ScreenAdapter.width(420),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "取消",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      color: Colors.black54),
                ),
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(420),
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  foregroundColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  controller.clearHistoryData();
                  Get.back();
                },
                child: Text(
                  "确定",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      color: Colors.black54),
                ),
              ),
            )
          ])
        ]),
      ),
    );
  }

  void _deleteHistoryDialog(String value) {
    Get.defaultDialog(
      title: "提示信息",
      middleText: "您确定删除吗？",
      confirm: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.red),
          foregroundColor: MaterialStateProperty.all(Colors.black38),
        ),
        onPressed: () {
          controller.removeHistoryData(value);
          Get.back();
        },
        child: const Text("确定"),
      ),
      cancel: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.black12),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text("取消"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        margin: EdgeInsets.only(
          bottom: ScreenAdapter.height(30),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TitleBanner(
              title: "搜索历史",
              leftSize: ScreenAdapter.fontSize(48),
              icon: Image.asset(
                "assets/images/clear.png",
                width: ScreenAdapter.fontSize(60),
                height: ScreenAdapter.fontSize(60),
              ),
              onPressed: () {
                Get.bottomSheet(
                  _clearHistoryBottomSheet(),
                );
              }),
          Wrap(
            children: state!
                .map(
                  (value) => InkWell(
                    splashColor: Colors.transparent,
                    radius: 0,
                    onLongPress: () {
                      _deleteHistoryDialog(value);
                    },
                    onTap: () {
                      controller.search(value: value);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenAdapter.width(32),
                        vertical: ScreenAdapter.height(16),
                      ),
                      margin: EdgeInsets.all(
                        ScreenAdapter.height(16),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Text(value),
                    ),
                  ),
                )
                .toList(),
          ),
        ]),
      ),
      onLoading: const LoadingView(),
      onEmpty: const EmptyView(),
      onError: (error) => const ErrorView(),
    );
  }
}
