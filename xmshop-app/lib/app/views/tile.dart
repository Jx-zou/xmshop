import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final double spacing;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  const Tile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.spacing = 10.0,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: width,
      height: height,
      padding: padding,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(right: spacing),
          child: leading,
        ),
        Expanded(
          child: InkResponse(
            onTap: onPressed,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              title ?? const SizedBox(),
              subtitle ?? const SizedBox(),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: spacing),
          child: trailing,
        ),
      ]),
    );
  }
}
