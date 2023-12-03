import 'package:flutter/material.dart';

class LabelIconButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;
  final TextStyle? style;
  final EdgeInsetsGeometry? margin;

  const LabelIconButton(
      {super.key,
      required this.onTap,
      required this.icon,
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
                children: [icon, Text(label, style: style)])));
  }
}
