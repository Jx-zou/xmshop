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
  final Widget? close;
  final Widget? bottom;

  const CloseBottomSheet({
    super.key,
    required this.child,
    this.close,
    this.width,
    this.height,
    this.closed,
    this.color,
    this.borderRadius,
    this.padding,
    this.closeColor,
    this.size = 20,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? MediaQuery.of(context).size.height * 3 / 4,
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
          child: InkResponse(
              onTap: closed,
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(width: size, height: size),
                child: close ?? Image.asset("assets/images/modal_close.png", width: 8.0, height: 8.0),
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
