import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/modules/search/views/search_guess_view.dart';

import '../controllers/xm_search_controller.dart';
import 'search_hot_view.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';

class SearchView extends GetView<XmSearchController> {
  const SearchView({super.key});

  void _deleteHistoryDialog(String value) =>
    Get.defaultDialog(
        title: "提示信息",
        middleText: "您确定删除吗？",
        confirm: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                MaterialStateProperty.all(Colors.red),
                foregroundColor:
                MaterialStateProperty.all(Colors.black38)),
            onPressed: () {
              controller.removeHistoryData(value);
              Get.back();
            },
            child: const Text("确定")),
        cancel: ElevatedButton(
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor:
                MaterialStateProperty.all(Colors.black12),
                foregroundColor:
                MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              Get.back();
            },
            child: const Text("取消")));

  Widget _historyView() {
    return controller.obx((state) => Wrap(
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
            .toList()));
  }

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

  Widget _body() {
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
        _historyView(),
        SizedBox(height: ScreenAdapter.height(30)),
        TitleBanner("猜你想搜",
            leftSize: ScreenAdapter.fontSize(48),
            iconSize: ScreenAdapter.fontSize(60),
            icon: Icons.refresh),
        SizedBox(height: ScreenAdapter.height(30)),
        const SearchGuessView(),
        SizedBox(height: ScreenAdapter.height(30)),
        const SearchHotView()
      ],
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.height(100),
          decoration: BoxDecoration(
              color: const Color.fromARGB(230, 240, 245, 245),
              borderRadius: BorderRadius.circular(30)),
          child: TextField(
            textInputAction: TextInputAction.search,
            autofocus: true,
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(
                    0, ScreenAdapter.height(20), 0, ScreenAdapter.height(50)),
                prefixIcon: Icon(
                  XmshopIcons.search,
                  size: ScreenAdapter.width(50),
                  color: Colors.black45,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none)),
            onChanged: (value) {
              controller.changeKeywords(value);
            },
            onSubmitted: (value) {
              controller.searchToProduct();
            },
          )),
      actions: [
        TextButton(
            onPressed: () {
              controller.searchToProduct();
            },
            child: Text("搜索",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(36),
                    color: Colors.black54)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 246, 246),
        appBar: _appBar(),
        body: _body());
  }
}
