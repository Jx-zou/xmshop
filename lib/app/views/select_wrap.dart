import 'package:flutter/material.dart';

typedef SelectBuilder = Widget Function(BuildContext context, int index);

class SelectWrap extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final double vertical;
  final double spacing;
  final int itemCount;
  final SelectBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const SelectWrap({
    super.key,
    this.title,
    this.titleStyle,
    this.vertical = 10.0,
    this.spacing = 0.0,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.itemCount = 0,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < itemCount; i++) {
      widgets.add(itemBuilder(context, i));
    }
    return Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text("$title", style: titleStyle),
          SizedBox(height: vertical),
          Wrap(spacing: spacing, children: widgets),
        ]);
  }
}
