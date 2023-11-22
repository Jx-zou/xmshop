import 'package:flutter/material.dart';

class IconCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final IconData? icon;
  final double? iconSize;
  final Color? activeColor;
  final Color? unActiveColor;
  final Color? fillColor;
  final BoxShape? shape;

  const IconCheckBox(
      {super.key,
      this.value = false,
      required this.onChanged,
      this.size = 18.0,
      this.icon,
      this.activeColor,
      this.unActiveColor,
      this.fillColor,
      this.shape, this.iconSize});

  @override
  State<StatefulWidget> createState() => _IconCheckBoxState();
}

class _IconCheckBoxState extends State<IconCheckBox> {
  @override
  Widget build(BuildContext context) {
    IconData icon = widget.icon ?? Icons.task_alt;
    Color activeColor = widget.activeColor ?? Colors.deepOrange;
    Color unActiveColor = widget.unActiveColor ?? Colors.white;
    Color fillColor = widget.fillColor ?? Colors.black12;
    BoxShape shape = widget.shape ?? BoxShape.circle;
    double iconSize = widget.iconSize ?? widget.size;

    return InkWell(
      splashColor: Colors.transparent,
      radius: 0,
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: shape,
            border: Border.all(color: widget.value ? fillColor : Colors.transparent),
            color: fillColor),
        child: widget.value ? Icon(icon, size: iconSize, color: widget.value ? activeColor : unActiveColor,) : null,
      ),
    );
  }
}
