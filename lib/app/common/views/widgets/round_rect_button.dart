import 'package:flutter/material.dart';

class RoundRectButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Gradient? gradient;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final Widget child;
  final VoidCallback onPressed;

  const RoundRectButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.border,
    this.margin,
    this.gradient,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        radius: 0,
        onTap: onPressed,
        child: Container(
            alignment: Alignment.center,
            width: width,
            height: height,
            margin: margin,
            padding: padding,
            decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: color,
                gradient: gradient,
                border: border),
            child: child));
  }
}
