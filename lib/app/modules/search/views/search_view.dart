import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'search_body_view.dart';
import 'search_hot_view.dart';
import 'search_guess_view.dart';
import '../controllers/xm_search_controller.dart';

import '../../../common/views/loading.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';

class SearchView extends GetView<XmSearchController> {
  const SearchView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                            0,
                            ScreenAdapter.height(20),
                            0,
                            ScreenAdapter.height(50)),
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
                    })),
            actions: [
              TextButton(
                  onPressed: () {
                    controller.searchToProduct();
                  },
                  child: Text("搜索",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(36),
                          color: Colors.black54)))
            ]),
        body: const SearchBodyView());
  }
}
