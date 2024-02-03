import 'package:flutter/material.dart';

import 'image_check_box.dart';

class ImageCheckBoxListTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget activeWidget;
  final Widget unActiveWidget;
  final double? mainSpacing;
  final double? crossSpacing;
  final Widget? leading;
  final Widget? title;
  final Widget? subTitle;
  final Widget? secondary;
  final CrossAxisAlignment titleCrossAxisAlignment;
  final VoidCallback? onPressed;

  const ImageCheckBoxListTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeWidget,
    required this.unActiveWidget,
    this.mainSpacing,
    this.crossSpacing,
    this.leading,
    this.title,
    this.subTitle,
    this.secondary,
    this.titleCrossAxisAlignment = CrossAxisAlignment.center,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double mainSpacing = this.mainSpacing ?? 15;
    double crossSpacing = this.crossSpacing ?? 10;
    Widget leading = this.leading ?? const SizedBox();
    Widget title = this.title ?? const SizedBox();
    Widget subTitle = this.subTitle ?? const SizedBox();
    Widget secondary = this.secondary ?? const SizedBox();
    return Row(children: [
      ImageCheckBox(
        value: value,
        onChanged: onChanged,
        activeWidget: activeWidget,
        unActiveWidget: unActiveWidget,
      ),
      Expanded(
        child: InkWell(
          onTap: onPressed,
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
            ),
          ]),
        ),
      ),
    ]);
  }
}
