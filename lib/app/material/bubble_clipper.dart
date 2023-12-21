import 'package:flutter/material.dart';

enum BubbleArrowDirection { top, bottom, left, right }

class BubbleClipper extends CustomClipper<Path> {
  final RelativeRect position;
  final Size size;
  final Radius radius;
  final double screenPadding;
  final double arrowWidth;
  final double arrowHeight;
  final double arrowBasisOffset;
  final double arrowPeakOffset;
  final double conicWeight;

  BubbleClipper({
    super.reclip,
    required this.radius,
    required this.position,
    required this.size,
    required this.conicWeight,
    this.screenPadding = 0,
    this.arrowWidth = 0,
    this.arrowHeight = 0,
    this.arrowBasisOffset = 0,
    this.arrowPeakOffset = 0,
  });

  @override
  Path getClip(Size size) {
    final BubbleArrowDirection direction = position.bottom + this.size.height < size.height ? BubbleArrowDirection.bottom : BubbleArrowDirection.top;

    final pathTriangle = Path();
    final pathRect = Path();

    final double arrowW = arrowWidth == 0 ? size.width : arrowWidth;
    final double arrowH = arrowHeight == 0 ? size.height : arrowHeight;

    final dWidth = (size.width - this.size.width).abs();
    double basisPointX = size.width / 2;
    if (position.left > position.right && position.right < dWidth) {
      basisPointX = size.width - this.size.width / 2 - position.right + screenPadding;
    } else if (position.left < position.right && position.left < dWidth) {
      basisPointX = position.left + this.size.width / 2 - screenPadding;
    }
    final peakPointX = basisPointX + arrowW * arrowPeakOffset;

    switch (direction) {
      case BubbleArrowDirection.top:
        drawArrow(pathTriangle, basisPointX - arrowW / 2, arrowH, peakPointX, 0, basisPointX + arrowW / 2, arrowH, conicWeight);
        pathRect.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, arrowH, size.width, size.height - arrowH), radius));
        break;
      case BubbleArrowDirection.bottom:
        drawArrow(pathTriangle, basisPointX - arrowW / 2, size.height - arrowH, peakPointX, size.height, basisPointX + arrowW / 2, size.height - arrowH, conicWeight);
        pathRect.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height - arrowH), radius));
        break;
      default:
        pathRect.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, size.width, size.height), radius));
        break;
    }
    pathTriangle.addPath(pathRect, const Offset(0, 0));
    return pathTriangle;
  }

  drawArrow(Path pathTriangle, double startX, double startY, double peakX, double peakY, double endX, double endY, double weight) {
    pathTriangle.moveTo(startX, startY);
    pathTriangle.conicTo(peakX, peakY, endX, endY, weight);
    pathTriangle.close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
