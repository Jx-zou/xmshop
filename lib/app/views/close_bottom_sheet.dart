import 'package:flutter/material.dart';

class CloseBottomSheet extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final VoidCallback? closed;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? closeColor;
  final double size;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final Widget? bottom;

  const CloseBottomSheet({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.closed,
    this.color,
    this.borderRadius,
    this.padding,
    this.closeColor,
    this.size = 20,
    this.icon,
    this.iconSize = 8,
    this.iconColor,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: borderRadius ??
            const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
      ),
      padding: padding ?? const EdgeInsets.all(15),
      child: Stack(children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            shape: const CircleBorder(),
            color: closeColor ?? Colors.black.withOpacity(0.05),
            child: InkResponse(
              onTap: closed,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(width: size, height: size),
                child: Icon(icon, size: 8, color: iconColor ?? Colors.black87),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: SizedBox(
            width: double.infinity,
            child: bottom,
          ),
        ),
      ]),
    );
  }
}
