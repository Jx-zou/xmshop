import 'package:flutter/material.dart';

import '../../../common/views/widgets/round_rect_button.dart';
import '../../../utils/screen_adapter.dart';

class BottomButton extends StatelessWidget {
  final String? title;
  final double? width;
  final List<Color> colors;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onPressed;

  const BottomButton(
      {super.key,
      this.title,
      required this.colors,
      required this.onPressed,
      this.margin,
      this.width});

  @override
  Widget build(BuildContext context) {
    return RoundRectButton(
        width: width,
        height: ScreenAdapter.height(125),
        margin: margin,
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(ScreenAdapter.height(80)),
        elevation: 0,
        onPressed: onPressed,
        child: Text("$title", style: const TextStyle(color: Colors.white)));
  }
}
