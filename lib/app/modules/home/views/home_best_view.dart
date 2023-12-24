import 'package:flutter/material.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/title_banner.dart';
import 'home_best_bar_view.dart';

class HomeBestView extends StatelessWidget {
  const HomeBestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(
            left: ScreenAdapter.width(25),
            right: ScreenAdapter.width(25),
          ),
          child: TitleBanner(
            "省心优惠",
            right: "全部优惠",
            icon: XmshopIcons.arrowRight,
            leftSize: ScreenAdapter.fontSize(48),
            rightSize: ScreenAdapter.fontSize(38),
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(350),
          child: const HomeBestBarView(),
        ),
      ]),
    );
  }
}
