import 'package:flutter/material.dart';

class TextTile extends StatelessWidget {
  final String? leading;
  final Widget? title;
  final Widget? trailing;
  final double? leadingSize;
  final Color? leadingColor;
  final GestureTapCallback? onTap;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;

  const TextTile({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.leadingColor,
    this.leadingSize = 10.0,
    this.onTap,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color leadingColor = this.leadingColor ?? themeData.primaryColor;
    String leading = this.leading ?? "";
    Widget title = this.title ?? Container();
    Widget trailing = this.trailing ?? Container();
    EdgeInsetsGeometry padding = this.padding ?? const EdgeInsets.all(3);

    return Container(
      key: key,
      width: width,
      height: height,
      padding: padding,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          leading,
          style: TextStyle(fontSize: leadingSize, color: leadingColor),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Expanded(child: title), trailing]),
          ),
        )
      ]),
    );
  }
}
