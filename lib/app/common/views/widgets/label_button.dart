import 'package:flutter/material.dart';

class LabelButton extends StatelessWidget {
  final Widget widget;
  final String label;
  final VoidCallback onTap;
  final TextStyle? style;
  final EdgeInsetsGeometry? margin;

  const LabelButton(
      {super.key,
      required this.onTap,
      required this.widget,
      required this.label,
      required this.style,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: margin,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [widget, Text(label, style: style)])));
  }
}
