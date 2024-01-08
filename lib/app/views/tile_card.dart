import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final double borderRadius;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Image image;
  final String title;
  final TextStyle? titleStyle;
  final String subTitle;
  final TextStyle? subTitleStyle;
  final double spacing;
  final Widget? tag;
  final Widget? trailing;

  const TileCard({
    super.key,
    this.onTap,
    this.borderRadius = 10,
    this.backgroundColor,
    required this.image,
    required this.title,
    required this.subTitle,
    this.titleStyle,
    this.subTitleStyle,
    this.spacing = 5,
    this.tag,
    this.trailing,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color backgroundColor = this.backgroundColor ?? themeData.primaryColor;
    TextStyle titleStyle = this.titleStyle ??
        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    TextStyle subTitleStyle = this.subTitleStyle ??
        const TextStyle(
            fontSize: 11,
            color: Colors.black38,
            overflow: TextOverflow.ellipsis);
    EdgeInsetsGeometry padding = this.padding ?? const EdgeInsets.all(5);

    Widget spacingBox(Widget? widget) {
      if (widget == null) {
        return const SizedBox();
      }
      return Container(margin: EdgeInsets.only(bottom: spacing), child: widget);
    }

    return InkWell(
      splashColor: Colors.transparent,
      radius: 0,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacingBox(image),
              spacingBox(
                Text(title, style: titleStyle, maxLines: 2),
              ),
              spacingBox(
                Text(subTitle, style: subTitleStyle),
              ),
              spacingBox(tag),
              spacingBox(trailing)
            ]),
      ),
    );
  }
}
