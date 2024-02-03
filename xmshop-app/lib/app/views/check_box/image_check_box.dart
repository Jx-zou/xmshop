import 'package:flutter/material.dart';

class ImageCheckBox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Widget activeWidget;
  final Widget unActiveWidget;

  const ImageCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.activeWidget,
    required this.unActiveWidget,
  });

  @override
  State<ImageCheckBox> createState() => _ImageCheckBoxState();
}

class _ImageCheckBoxState extends State<ImageCheckBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: widget.value ? widget.activeWidget : widget.unActiveWidget,
    );
  }
}
