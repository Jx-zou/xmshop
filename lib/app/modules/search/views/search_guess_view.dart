import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/search_guess_controller.dart';

class SearchGuessView extends GetView<SearchGuessController> {
  const SearchGuessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      TitleBanner("猜你想搜",
          leftSize: ScreenAdapter.fontSize(48),
          iconSize: ScreenAdapter.fontSize(60),
          icon: Icons.refresh),
      SizedBox(height: ScreenAdapter.height(30)),
      controller.obx((state) => Wrap(
          children: state!
              .map((value) => InkWell(
                  splashColor: Colors.transparent,
                  radius: 0,
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
                      child: Text(value))))
              .toList()))
    ]);
  }
}
