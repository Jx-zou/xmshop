import 'package:flutter/material.dart';

const double defaultHeight = 128;

class EmptyView extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const EmptyView({super.key, this.color, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    final double height = this.height ?? defaultHeight;
    final Color color = this.color ?? themeData.primaryColor;

    return Container(
      width: width,
      height: height,
      color: color,
    );
  }
}
