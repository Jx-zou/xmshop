import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

enum LoadingType { circle, threeBounce }

class LoadingView extends StatelessWidget {
  final LoadingType type;
  final double size;
  final Color? color;
  final Duration duration;

  const LoadingView({
    super.key,
    this.type = LoadingType.circle,
    this.size = 40,
    this.color,
    this.duration = const Duration(milliseconds: 1200),
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingType.threeBounce:
        return SpinKitThreeBounce(size: size, color: color, duration: duration);
      default:
        return SpinKitCircle(size: size, color: color, duration: duration);
    }
  }
}