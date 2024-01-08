import 'package:flutter/material.dart';

const Duration _kDuration = Duration(milliseconds: 300);
const double _kCloseIntervalEnd = 2.0 / 3.0;
const double _kMaxWidth = 5.0 * _kWidthStep;
const double _kMinWidth = 2.0 * _kWidthStep;
const double _kWidthStep = 56.0;

class _PopupShapeLayoutDelegate extends SingleChildLayoutDelegate {
  final RelativeRect position;
  final Size size;
  final TextDirection textDirection;
  final double screenPadding;

  _PopupShapeLayoutDelegate({
    required this.position,
    required this.size,
    required this.textDirection,
    required this.screenPadding,
  });

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.smallest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double y = position.top;
    double x;
    if (position.left > position.right) {
      x = size.width - position.right - childSize.width;
    } else if (position.left < position.right) {
      x = position.left;
    } else {
      switch (textDirection) {
        case TextDirection.rtl:
          x = size.width - position.right - childSize.width;
        case TextDirection.ltr:
          x = position.left;
      }
    }
    final Offset wantedPosition = Offset(x, y);
    final Rect screen = Offset.zero & size;
    return _fitInsideScreen(screen, childSize, wantedPosition);
  }

  Offset _fitInsideScreen(Rect screen, Size childSize, Offset wantedPosition) {
    double x = wantedPosition.dx;
    double y = wantedPosition.dy;
    if (x <= screen.left + screenPadding + (childSize.width - size.width) / 2) {
      x = screen.left + screenPadding;
    } else if (x + childSize.width >=
        screen.right - screenPadding - (childSize.width - size.width) / 2) {
      x = screen.right - childSize.width - screenPadding;
    } else {
      x = position.left - (childSize.width - size.width) / 2;
    }

    if (y < screen.top + screenPadding) {
      y = screen.top + size.height + screenPadding;
    } else if (y + childSize.height > screen.bottom - screenPadding) {
      y = screen.bottom -
          childSize.height -
          2 * size.height -
          position.bottom -
          screenPadding;
    }
    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_PopupShapeLayoutDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _PopupShapeRoute<T> extends PopupRoute<T> {
  final RelativeRect position;
  final Size size;
  final Widget? child;
  final CustomClipper<Path>? clipper;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final double screenPadding;

  _PopupShapeRoute({
    required this.position,
    required this.child,
    required this.size,
    required this.screenPadding,
    this.clipper,
    this.padding,
    this.constraints,
    super.settings,
  });

  @override
  Animation<double> createAnimation() {
    return CurvedAnimation(
      parent: super.createAnimation(),
      curve: Curves.linear,
      reverseCurve: const Interval(0.0, _kCloseIntervalEnd),
    );
  }

  @override
  Duration get transitionDuration => _kDuration;

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    Widget current = ClipPath(
        clipper: clipper,
        child: child);

    if (padding != null) {
      current = Padding(padding: padding!, child: current);
    }

    return Builder(builder: (BuildContext context) {
      return CustomSingleChildLayout(
        delegate: _PopupShapeLayoutDelegate(
          position: position,
          size: size,
          textDirection: Directionality.of(context),
          screenPadding: screenPadding,
        ),
        child: ConstrainedBox(
          constraints: this.constraints ??
              const BoxConstraints(
                minWidth: _kMinWidth,
                maxWidth: _kMaxWidth,
              ),
          child: current,
        ),
      );
    });
  }
}

Future<T?> showShape<T>({
  required BuildContext context,
  required RelativeRect position,
  required Widget child,
  required Size size,
  final double? screenPadding,
  final BoxConstraints? constraints,
  final EdgeInsetsGeometry? padding,
  final CustomClipper<Path>? clipper,
  final bool useRootNavigator = false,
  final RouteSettings? routeSettings,
}) {
  final NavigatorState navigator = Navigator.of(context, rootNavigator: useRootNavigator);
  return navigator.push(
    _PopupShapeRoute<T>(
      clipper: clipper,
      position: position,
      padding: padding,
      constraints: constraints,
      size: size,
      settings: routeSettings,
      screenPadding: screenPadding ?? 0.0,
      child: child,
    ),
  );
}
