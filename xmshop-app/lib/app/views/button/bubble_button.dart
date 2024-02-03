import 'package:flutter/material.dart';

import '../clipper/bubble_clipper.dart';
import '../popup_shape.dart';

class BubbleButton<T> extends StatefulWidget {
  final Widget popupChild;
  final Widget child;
  final Offset offset;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onOpened;
  final VoidCallback? onClosed;
  final BoxConstraints? constraints;
  final bool enabled;
  final bool enableFeedback;
  final double arrowWidth;
  final double arrowHeight;
  final double conicWeight;
  final Radius? radius;
  final double screenPadding;
  final Color? color;

  const BubbleButton({
    super.key,
    required this.child,
    required this.popupChild,
    this.onOpened,
    this.onClosed,
    this.enabled = true,
    this.offset = Offset.zero,
    this.enableFeedback = true,
    this.constraints,
    this.padding,
    this.arrowWidth = 15,
    this.arrowHeight = 8,
    this.conicWeight = 10,
    this.radius,
    this.screenPadding = 8.0,
    this.color,
  });

  @override
  BubbleButtonState<T> createState() => BubbleButtonState<T>();
}

class BubbleButtonState<T> extends State<BubbleButton> {
  void popup() {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay?.context.findRenderObject() as RenderBox;
    final Offset offset = Offset(0.0, button.size.height) + widget.offset;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(offset),
        button.localToGlobal(button.size.bottomRight(Offset.zero) + offset),
      ),
      Offset.zero & overlay.size,
    );

    final Widget child = Material(
      color: widget.color ?? Colors.black54,
      child: Padding(
          padding: EdgeInsets.only(top: widget.arrowHeight),
          child: widget.popupChild),
    );

    final CustomClipper<Path> clipper = BubbleClipper(
      position: position,
      size: button.size,
      arrowWidth: widget.arrowWidth,
      arrowHeight: widget.arrowHeight,
      conicWeight: widget.conicWeight,
      radius: widget.radius ?? const Radius.circular(10),
      screenPadding: widget.screenPadding,
    );

    widget.onOpened?.call();
    showShape<T?>(
            context: context,
            position: position,
            size: button.size,
            clipper: clipper,
            child: child,
            padding: widget.padding,
            screenPadding: widget.screenPadding)
        .then<void>((T? newValue) {
      if (newValue == null) {
        widget.onClosed?.call();
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.enabled ? popup : null,
      enableFeedback: widget.enableFeedback,
      child: widget.child,
    );
  }
}
