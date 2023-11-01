import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';

class HomeAdvertisementView extends GetView {
  const HomeAdvertisementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: const DecorationImage(
              image: AssetImage("assets/images/xiaomiBanner2.png"),
              fit: BoxFit.cover)),
      height: ScreenAdapter.height(420),
    );
  }
}
