import 'package:flutter/material.dart';

import 'flat_button.dart';

class ShapeButton extends FlatButton {
  final Color? color;
  final double elevation;
  final Color? shadowColor;
  final  BorderRadiusGeometry? borderRadius;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry? margin;

  const ShapeButton({
    this.color,
    this.elevation = 0.0,
    this.shadowColor,
    this.borderRadius,
    this.shape,
    this.margin,
    super.key,
    super.width,
    super.height,
    super.radius,
    super.splashColor,
    super.highlightColor,
    super.alignment,
    super.padding,
    required super.child,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = Material(
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      shape: shape,
      child: super.build(context),
    );

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return current;
  }
}
