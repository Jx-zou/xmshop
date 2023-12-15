import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final Widget widget;
  final String label;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  const LabelButton({
    super.key,
    this.margin,
    this.padding,
    this.style,
    required this.widget,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Widget current = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
        Text(label, style: style),
      ],
    );

    if (padding != null) {
      current = Padding(padding: padding!, child: current);
    }

    if (margin != null) {
      current = Padding(padding: margin!, child: current);
    }

    return InkResponse(onTap: onPressed, child: current);
  }
}
