import 'package:flutter/material.dart';

class FlatButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? splashColor;
  final Color? highlightColor;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget child;
  final VoidCallback onPressed;

  const FlatButton({
    super.key,
    this.width,
    this.height,
    this.splashColor,
    this.highlightColor,
    this.padding,
    this.margin,
    this.alignment,
    this.radius = 0.0,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = Align(alignment: alignment ?? Alignment.center, child: child);

    if (padding != null) {
      current = Padding(padding: padding!, child: current);
    }

    current = ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: current,
    );

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return InkResponse(
        splashColor: splashColor,
        highlightColor: highlightColor,
        radius: radius,
        onTap: onPressed,
        child: current);
  }
}
