import 'package:flutter/material.dart';

class TitleBanner extends StatelessWidget {
  final String? left;
  final String? right;
  final IconData? icon;
  final double? leftSize;
  final double? rightSize;
  final double? iconSize;
  final FontWeight? leftWeight;
  final FontWeight? rightWeight;
  final Color? leftColor;
  final Color? rightColor;
  final Color? iconColor;
  final VoidCallback? onTap;

  const TitleBanner(
    this.left, {
    this.right,
    this.icon,
    this.onTap,
    this.leftSize,
    this.rightSize,
    this.iconSize,
    this.leftWeight,
    this.rightWeight,
    this.leftColor,
    this.rightColor,
    super.key, this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    String left = this.left ?? "";
    String right = this.right ?? "";
    Color leftColor = this.leftColor ?? Colors.black87;
    Color rightColor = this.rightColor ?? Colors.black38;
    IconData icon = this.icon ?? Icons.keyboard_arrow_right;
    FontWeight leftWeight = this.leftWeight ?? FontWeight.w600;
    FontWeight rightWeight = this.rightWeight ?? FontWeight.w400;

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(left,
              style: TextStyle(
                color: leftColor,
                fontSize: leftSize,
                fontWeight: leftWeight,
              )),
          InkWell(
              onTap: onTap,
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(right,
                        style: TextStyle(
                          color: rightColor,
                          fontSize: rightSize,
                          fontWeight: rightWeight,
                        )),
                    Icon(
                      icon,
                      color: iconColor ?? rightColor,
                      size: iconSize ?? rightSize,
                    )
                  ]))
        ]);
  }
}
