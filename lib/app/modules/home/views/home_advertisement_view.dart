import 'package:flutter/material.dart';

import '../../../utils/screen_adapter.dart';

class HomeAdvertisementView extends StatelessWidget {
  const HomeAdvertisementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
            image: const DecorationImage(
                image: AssetImage("assets/images/xiaomiBanner2.png"),
                fit: BoxFit.cover)),
        height: ScreenAdapter.height(420));
  }
}