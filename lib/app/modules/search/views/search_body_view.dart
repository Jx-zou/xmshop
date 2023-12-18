import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/utils/screen_adapter.dart';
import '../controllers/xm_search_controller.dart';
import 'search_guess_view.dart';
import 'search_history_view.dart';
import 'search_hot_view.dart';

class SearchBodyView extends GetView<XmSearchController> {
  const SearchBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.75],
            colors: [themeData.scaffoldBackgroundColor, Colors.white]),
      ),
      child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenAdapter.width(30),
          ),
          children: const [
            SearchHistoryView(),
            SearchGuessView(),
            SearchHotView()
          ]),
    );
  }
}
