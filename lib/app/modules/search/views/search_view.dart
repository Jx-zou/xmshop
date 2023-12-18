import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/xm_search_controller.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../common/icons/xmshop_icons.dart';
import 'search_body_view.dart';

class SearchView extends GetView<XmSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          ScreenAdapter.height(150),
        ),
        child: AppBar(
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            elevation: 0,
            titleSpacing: 0,
            leadingWidth: ScreenAdapter.width(120),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                XmshopIcons.arrowLeft,
                size: ScreenAdapter.fontSize(42),
              ),
            ),
            title: Container(
              height: ScreenAdapter.height(108),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  ScreenAdapter.width(54),
                ),
              ),
              child: TextField(
                  textInputAction: TextInputAction.search,
                  autofocus: true,
                  cursorWidth: ScreenAdapter.width(2),
                  cursorHeight: ScreenAdapter.height(56),
                  cursorColor: Colors.black45,
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        bottom: ScreenAdapter.height(40),
                      ),
                      prefixIconColor: Colors.black45,
                      prefixIconConstraints: BoxConstraints(
                        minWidth: ScreenAdapter.width(0),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                          left: ScreenAdapter.width(40),
                          right: ScreenAdapter.width(30),
                        ),
                        child: Icon(
                          XmshopIcons.search,
                          size: ScreenAdapter.fontSize(42),
                        ),
                      ),
                      border: InputBorder.none),
                  onChanged: (value) {
                    controller.changeKeywords(value);
                  },
                  onSubmitted: (value) {
                    controller.searchToProduct();
                  }),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenAdapter.width(40),
                ),
                child: InkWell(
                  onTap: () {
                    controller.searchToProduct();
                  },
                  child: Text(
                    "搜索",
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(42),
                        color: Colors.black87),
                  ),
                ),
              )
            ]),
      ),
      body: const SearchBodyView(),
    );
  }
}
