import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../indicator/linear_inside_indicator.dart';

class LinearInsideSwiperPaginationBuilder extends SwiperPlugin {
  final Color activeColor;
  final Color color;
  final double width;
  final double height;

  LinearInsideSwiperPaginationBuilder({
    this.activeColor = Colors.white,
    this.color = Colors.black26,
    this.width = 95.0,
    this.height = 3.0,
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    return SizedBox(
      width: width,
      height: height,
      child: LinearInsideIndicator(
        count: config.itemCount,
        active: config.activeIndex,
        color: color,
        activeColor: activeColor,
      ),
    );
  }
}
