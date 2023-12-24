import 'package:flutter/material.dart';

const String defaultTagsString = "该页面走丢了~";

class ErrorView extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final double? tagSize;
  final Color? tagColor;
  final Widget? tag;

  const ErrorView({
    super.key,
    this.tag,
    this.width,
    this.height,
    this.color,
    this.tagSize,
    this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color color = this.color ?? themeData.primaryColorLight;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      color: color,
      child: tag ??
          Text(
            defaultTagsString,
            style: TextStyle(
              fontSize: tagSize ?? 12,
              color: tagColor ?? Colors.blueGrey,
              decoration: TextDecoration.none,
            ),
          ),
    );
  }
}
