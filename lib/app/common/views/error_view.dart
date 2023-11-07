import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String defaultTag = "该页面走丢了~";
  final double? width;
  final double? height;
  final Color? color;
  final double? tagSize;
  final Color? tagColor;
  final String? tag;

  const ErrorView(this.tag, {super.key, this.width, this.height, this.color, this.tagSize, this.tagColor});

  @override
  Widget build(BuildContext context) {

    ThemeData themeData = Theme.of(context);
    Color color = this.color ?? themeData.primaryColor;
    String tag = this.tag ?? defaultTag;

    return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        color: color,
        child: Text(tag,
            style: TextStyle(
                fontSize: tagSize,
                color: tagColor)));
  }
}