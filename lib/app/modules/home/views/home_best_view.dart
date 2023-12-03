import 'package:flutter/material.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';
import 'home_best_banner_view.dart';
import 'home_best_list_view.dart';

class HomeBestView extends StatelessWidget {
  const HomeBestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(25), right: ScreenAdapter.width(25)),
            child: TitleBanner("省心优惠",
                right: "全部优惠",
                icon: XmshopIcons.arrowRight,
                leftSize: ScreenAdapter.fontSize(48),
                rightSize: ScreenAdapter.fontSize(38))),
        Container(
            color: Colors.white38,
            height: ScreenAdapter.height(350),
            child: HomeBestBannerView()),
        Container(
            padding: EdgeInsets.only(
                left: ScreenAdapter.width(25),
                right: ScreenAdapter.width(25),
                top: ScreenAdapter.width(25)),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white38, Colors.white24, Colors.white10],
                    stops: [0.0, 0.1, 1.0])),
            child: HomeBestListView())
      ],
    );
  }
}