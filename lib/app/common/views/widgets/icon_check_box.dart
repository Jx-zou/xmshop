import 'package:flutter/material.dart';

class IconCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? size;
  final EdgeInsetsGeometry? margin;
  final IconData? icon;
  final double? iconSize;
  final Color? activeColor;
  final Color? unActiveColor;
  final Color? fillColor;
  final BoxShape? shape;

  const IconCheckBox(
      {super.key,
      required this.value,
      required this.onChanged,
      this.size,
      this.icon,
      this.activeColor,
      this.unActiveColor,
      this.fillColor,
      this.shape,
      this.iconSize,
      this.margin});

  @override
  State<StatefulWidget> createState() => _IconCheckBoxState();
}

class _IconCheckBoxState extends State<IconCheckBox> {
  @override
  Widget build(BuildContext context) {
    IconData icon = widget.icon ?? Icons.task_alt;
    Color activeColor = widget.activeColor ?? Colors.white;
    Color unActiveColor = widget.unActiveColor ?? Colors.transparent;
    Color fillColor = widget.fillColor ?? Colors.black.withOpacity(0.05);
    BoxShape shape = widget.shape ?? BoxShape.circle;
    double size = widget.size ?? 18.0;
    double iconSize = widget.iconSize ?? 12.0;

    return InkWell(
      splashColor: Colors.transparent,
      radius: 0,
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: size,
        height: size,
        margin: widget.margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: shape,
            border: Border.all(color: widget.value ? fillColor : Colors.black.withOpacity(0.05)),
            color: fillColor),
        child: widget.value
            ? Icon(
                icon,
                size: iconSize,
                color: widget.value ? activeColor : unActiveColor,
              )
            : null,
      ),
    );
  }
}
