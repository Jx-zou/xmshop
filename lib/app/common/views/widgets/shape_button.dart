import 'package:flutter/material.dart';

import 'flat_button.dart';

class ShapeButton extends FlatButton {
  final Color? color;
  final double elevation;
  final Color? shadowColor;
  final  BorderRadiusGeometry? borderRadius;
  final ShapeBorder? shape;

  const ShapeButton({
    this.color,
    this.elevation = 0.0,
    this.shadowColor,
    this.borderRadius,
    this.shape,
    super.key,
    super.width,
    super.height,
    super.radius,
    super.splashColor,
    super.highlightColor,
    super.alignment,
    super.padding,
    super.margin,
    required super.child,
    required super.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: color,
      shadowColor: shadowColor,
      borderRadius: borderRadius,
      shape: shape,
      child: super.build(context),
    );
  }
}
