import 'package:flutter/material.dart';

class RoundRectButton extends StatelessWidget {
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;
  final double elevation;
  final double borderRadius;
  final Widget child;
  final GestureTapCallback? onPressed;

  const RoundRectButton(
      {super.key,
      this.size = 20,
      this.backgroundColor = Colors.black54,
      this.foregroundColor = Colors.white,
      this.elevation = 10,
      this.borderRadius = 10,
      required this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                alignment: Alignment.center,
                backgroundColor:
                MaterialStateProperty.all(backgroundColor),
                foregroundColor:
                MaterialStateProperty.all(foregroundColor),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius)))),
            child: child));
  }
}
