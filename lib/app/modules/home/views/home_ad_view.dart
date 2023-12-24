import 'package:flutter/material.dart';

import '../../../common/utils/screen_adapter.dart';

class HomeAdView extends StatelessWidget {
  const HomeAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenAdapter.height(420),
      padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(30)),
        child: Image.asset(
          "assets/images/adBanner.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
