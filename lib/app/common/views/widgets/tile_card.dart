import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final VoidCallback? onTap;
  final double borderRadius;
  final double aspectRatio;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final ImageProvider image;
  final String title;
  final TextStyle? titleStyle;
  final String subTitle;
  final TextStyle? subTitleStyle;
  final double spacing;
  final Widget? tag;
  final Widget? trailing;

  const TileCard(
      {super.key,
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
      this.aspectRatio = 1 / 1,
      this.padding});

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
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                color: backgroundColor),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              spacingBox(Image(image: image)),
              spacingBox(Text(title, style: titleStyle)),
              spacingBox(Text(subTitle, style: subTitleStyle)),
              spacingBox(tag),
              spacingBox(trailing)
            ])));
  }
}
