import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;

  const ErrorView({
    super.key,
    this.child,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      color: color ?? Colors.white,
      child: child
    );
  }
}
