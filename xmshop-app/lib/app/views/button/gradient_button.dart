import 'package:flutter/material.dart';

import 'flat_button.dart';

class GradientButton extends FlatButton {
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final BoxBorder? border;
  final BoxShape boxShape;
  final List<BoxShadow>? boxShadow;
  final BorderRadiusGeometry? borderRadius;

  const GradientButton({
    this.boxShadow,
    this.boxShape = BoxShape.rectangle,
    this.color,
    this.borderRadius,
    this.border,
    this.gradient,
    this.margin,
    super.key,
    super.width,
    super.height,
    super.padding,
    super.alignment,
    super.splashColor,
    super.highlightColor,
    super.radius = 0.0,
    required super.child,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        shape: boxShape,
      ),
      child: super.build(context),
    );

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return current;
  }
}
