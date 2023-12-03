import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/xm_search_controller.dart';

class SearchHistoryView extends GetView<XmSearchController> {
  const SearchHistoryView({super.key});

  void _deleteHistoryDialog(String value) {
    Get.defaultDialog(
        title: "提示信息",
        middleText: "您确定删除吗？",
        confirm: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.black38)),
            onPressed: () {
              controller.removeHistoryData(value);
              Get.back();
            },
            child: const Text("确定")),
        cancel: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.back();
            },
            child: const Text("取消")));
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) => Wrap(
            children: state!
                .map((value) => InkWell(
                splashColor: Colors.transparent,
                radius: 0,
                onLongPress: () {
                  _deleteHistoryDialog(value);
                },
                onTap: () {
                  controller.onKeywordsTap(value);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.height(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Text(value),
                )))
                .toList()),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }

}