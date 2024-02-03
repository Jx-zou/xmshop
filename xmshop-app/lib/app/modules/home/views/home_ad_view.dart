import 'package:flutter/material.dart';

import '../../../utils/screen_adapter.dart';

class HomeAdView extends StatelessWidget {
  const HomeAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenAdapter.height(450),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(30)),
        child: Image.asset(
          "assets/images/ad_banner.png",
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
