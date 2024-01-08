import 'package:flutter/material.dart';

import '../../../utils/screen_adapter.dart';

class HomeQaBannerView extends StatelessWidget {
  const HomeQaBannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(30)),
      child: Image.asset("assets/images/qaBanner.png", fit: BoxFit.cover),
    );
  }
}