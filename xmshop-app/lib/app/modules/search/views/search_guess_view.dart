import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/title_banner.dart';
import '../controllers/search_guess_controller.dart';

class SearchGuessView extends GetView<SearchGuessController> {
  const SearchGuessView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitleBanner(
          title: "猜你想搜",
          leftSize: ScreenAdapter.fontSize(48),
          icon: Image.asset(
            "assets/images/refresh.png",
            width: ScreenAdapter.fontSize(60),
            height: ScreenAdapter.fontSize(60),
          ),
        ),
        Wrap(
          children: state!
              .map(
                (value) => InkWell(
                  onTap: () {
                    controller.searchController.search(value: value);
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
        )
      ]),
      onLoading: const LoadingView(),
      onEmpty: const EmptyView(),
      onError: (error) => const ErrorView(),
    );
  }
}
