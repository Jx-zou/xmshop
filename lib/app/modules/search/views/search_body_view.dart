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

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.all(ScreenAdapter.height(20)),
        children: [
          const SearchHistoryView(),
          SizedBox(height: ScreenAdapter.height(30)),
          const SearchGuessView(),
          SizedBox(height: ScreenAdapter.height(30)),
          const SearchHotView()
        ]
    );
  }
}