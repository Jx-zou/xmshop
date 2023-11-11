import 'package:flutter/material.dart';

class CloseBottomSheet extends StatelessWidget {
  final Widget? child;
  final Icon? icon;
  final double? width;
  final double? height;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? closeSize;
  final BorderRadiusGeometry? closeBorderRadius;
  final VoidCallback? closed;
  final Color? closeBackgroundColor;
  final Color? closeForegroundColor;

  const CloseBottomSheet(
      {super.key,
      this.child,
      this.width,
      this.height,
      this.color,
      this.borderRadius,
      this.padding,
      this.closeSize,
      this.closeBorderRadius,
      this.closed,
      this.closeBackgroundColor,
      this.closeForegroundColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    double closeSize = this.closeSize ?? 20;
    Widget child = this.child ?? Container();
    Icon icon = this.icon ?? const Icon(Icons.dangerous_rounded);
    Color color = this.color ?? Colors.white;
    Color closeBackgroundColor = this.closeBackgroundColor ?? Colors.black.withOpacity(0.05);
    Color closeForegroundColor = this.closeForegroundColor ?? Colors.white;
    EdgeInsetsGeometry padding =
        this.padding ?? const EdgeInsets.fromLTRB(15, 15, 15, 0);
    EdgeInsetsGeometry closePadding = this.padding ?? const EdgeInsets.all(0);
    BorderRadiusGeometry borderRadius = this.borderRadius ??
        const BorderRadius.vertical(top: Radius.circular(10));
    BorderRadiusGeometry closeBorderRadius = this.closeBorderRadius ??
        BorderRadius.circular(10);

    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color, borderRadius: borderRadius),
        padding: padding,
        child: Stack(
          children: [
            child,
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                  width: closeSize,
                  height: closeSize,
                  child: ElevatedButton(
                      onPressed: closed,
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          padding: MaterialStateProperty.all(closePadding),
                          minimumSize: MaterialStateProperty.all(Size.zero),
                          backgroundColor:
                              MaterialStateProperty.all(closeBackgroundColor),
                          foregroundColor:
                              MaterialStateProperty.all(closeForegroundColor),
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: closeBorderRadius))),
                      child: icon)),
            )
          ],
        ));
  }
}
