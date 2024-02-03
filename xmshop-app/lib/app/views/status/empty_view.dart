import 'package:flutter/material.dart';

const double kEmptyHeight = 32;

class EmptyView extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;

  const EmptyView({
    super.key,
    this.color,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? kEmptyHeight,
      color: color ?? Colors.transparent,
      child: child,
    );
  }
}
