import 'package:flutter/material.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';
import 'home_hot_list_view.dart';
import 'home_hot_swiper_view.dart';

class HomeHotView extends StatelessWidget {
  const HomeHotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(
        ScreenAdapter.width(30),
      ),
      child: Column(children: [
        TitleBanner(
          "热销甄选",
          right: "更多手机",
          icon: XmshopIcons.arrowRight,
          leftSize: ScreenAdapter.fontSize(48),
          rightSize: ScreenAdapter.fontSize(38),
        ),
        Row(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: ScreenAdapter.height(738),
              child: Padding(
                padding: EdgeInsets.only(
                  top: ScreenAdapter.height(10),
                  bottom: ScreenAdapter.height(10),
                ),
                child: const HomeHotSwiperView(),
              ),
            ),
          ),
          SizedBox(
            width: ScreenAdapter.width(20),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: ScreenAdapter.height(738),
              child: const HomeHotListView(),
            ),
          )
        ])
      ]),
    );
  }
}
