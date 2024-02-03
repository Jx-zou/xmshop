import 'package:flutter/material.dart';

class TitleBanner extends StatelessWidget {
  final String title;
  final String more;
  final Widget? icon;
  final double? leftSize;
  final double? rightSize;
  final FontWeight? leftWeight;
  final FontWeight? rightWeight;
  final Color? leftColor;
  final Color? rightColor;
  final VoidCallback? onPressed;

  const TitleBanner({
    this.title = "",
    this.more = "",
    this.icon,
    this.onPressed,
    this.leftSize,
    this.rightSize,
    this.leftWeight,
    this.rightWeight,
    this.leftColor,
    this.rightColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color leftColor = this.leftColor ?? Colors.black87;
    Color rightColor = this.rightColor ?? Colors.black38;
    FontWeight leftWeight = this.leftWeight ?? FontWeight.w600;
    FontWeight rightWeight = this.rightWeight ?? FontWeight.w400;

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: leftColor,
              fontSize: leftSize,
              fontWeight: leftWeight,
            ),
          ),
          InkWell(
            onTap: onPressed,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    more,
                    style: TextStyle(
                      color: rightColor,
                      fontSize: rightSize,
                      fontWeight: rightWeight,
                    ),
                  ),
                  icon ?? const SizedBox()
                ]),
          )
        ]);
  }
}
