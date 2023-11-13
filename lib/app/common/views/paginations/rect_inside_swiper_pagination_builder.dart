import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class RectInsideSwiperPaginationBuilder extends SwiperPlugin {
  late Color? activeColor;
  late Color? color;
  late final double? width;
  late final double? height;
  late final Key? key;

  RectInsideSwiperPaginationBuilder(
      {this.activeColor = Colors.white,
      this.color = Colors.black26,
      this.width = 95.0,
      this.height = 3.0,
      this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return SizedBox(
      width: width,
      height: height,
      child: LinearProgressIndicator(
        value: (config.activeIndex + 1) / config.itemCount,
        borderRadius: BorderRadius.circular(2),
        backgroundColor: color,
        valueColor: AlwaysStoppedAnimation(activeColor)
      ),
    );
  }
}
