import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';

class ProductDetailsMoreView extends GetView {
  const ProductDetailsMoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(500),
      color: Colors.blue,
    );
  }
}