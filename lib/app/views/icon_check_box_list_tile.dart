import 'package:flutter/material.dart';

import 'icon_check_box.dart';

class IconCheckBoxListTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? size;
  final IconData? icon;
  final double? iconSize;
  final double? mainSpacing;
  final double? crossSpacing;
  final Color? activeColor;
  final Color? unActiveColor;
  final Color? fillColor;
  final BoxShape? shape;
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? secondary;
  final CrossAxisAlignment titleCrossAxisAlignment;
  final VoidCallback? onTap;

  const IconCheckBoxListTile(
      {super.key,
      required this.value,
      required this.onChanged,
      this.size,
      this.icon,
      this.iconSize,
      this.activeColor,
      this.unActiveColor,
      this.fillColor,
      this.shape,
      this.mainSpacing,
      this.crossSpacing,
      this.leading,
      this.title,
      this.subTitle,
      this.secondary,
      this.titleCrossAxisAlignment = CrossAxisAlignment.center,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    double mainSpacing = this.mainSpacing ?? 15;
    double crossSpacing = this.crossSpacing ?? 10;
    Widget leading = this.leading ?? const SizedBox();
    Widget title = this.title ?? const SizedBox();
    Widget subTitle = this.subTitle ?? const SizedBox();
    Widget secondary = this.secondary ?? const SizedBox();
    return Row(children: [
      IconCheckBox(
        value: value,
        icon: icon,
        size: size,
        iconSize: iconSize,
        onChanged: onChanged,
        shape: shape,
        activeColor: activeColor,
        unActiveColor: unActiveColor,
        fillColor: fillColor,
        margin: EdgeInsets.only(right: mainSpacing),
      ),
      Expanded(
        child: InkWell(
          onTap: onTap,
          child: Row(children: [
            leading,
            SizedBox(width: mainSpacing),
            Expanded(
              child: Column(
                  crossAxisAlignment: titleCrossAxisAlignment,
                  children: [
                    title,
                    SizedBox(height: crossSpacing),
                    subTitle,
                    SizedBox(height: crossSpacing),
                    secondary
                  ]),
            )
          ]),
        ),
      ),
    ]);
  }
}
