import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';

class ProductDetailsRecommendedView extends GetView {
  const ProductDetailsRecommendedView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(500),
      color: Colors.red,
    );
  }
}
