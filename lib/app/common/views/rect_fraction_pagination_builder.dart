import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class RectFractionPaginationBuilder extends SwiperPlugin {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? color;
  final Color? activeColor;
  final double fontSize;
  final double activeFontSize;
  final Key? key;

  const RectFractionPaginationBuilder({
    this.borderRadius,
    this.width = 80.0,
    this.height = 40.0,
    this.backgroundColor,
    this.color,
    this.fontSize = 20.0,
    this.key,
    this.activeColor,
    this.activeFontSize = 35.0,
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    int itemCount = config.itemCount;
    if (itemCount <= 1) {
      return Container();
    }

    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;
    Color backgroundColor = this.backgroundColor ?? themeData.primaryColor;
    BorderRadiusGeometry borderRadius = this.borderRadius ?? BorderRadius.circular(10);

    if (Axis.vertical == config.scrollDirection) {
      return Container(
          key: key,
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "${config.activeIndex + 1}",
                style: TextStyle(color: activeColor, fontSize: activeFontSize),
              ),
              Text(
                "/",
                style: TextStyle(color: color, fontSize: fontSize),
              ),
              Text(
                "$itemCount",
                style: TextStyle(color: color, fontSize: fontSize),
              )
            ],
          ));
    } else {
      return Container(
          key: key,
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            key: key,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "${config.activeIndex + 1}",
                style: TextStyle(color: activeColor, fontSize: activeFontSize),
              ),
              Text(
                " / $itemCount",
                style: TextStyle(color: color, fontSize: fontSize),
              )
            ],
          ));
    }
  }
}
