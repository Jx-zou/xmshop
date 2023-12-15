import 'package:flutter/material.dart';

class NumView extends StatelessWidget {
  final double? width;
  final double? height;

  final num? number;
  final TextStyle? intStyle;
  final TextStyle? fractionStyle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const NumView(
    this.number, {
    super.key,
    this.width,
    this.height,
    this.intStyle,
    this.fractionStyle,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle intStyle = this.intStyle ?? const TextStyle(fontSize: 16.0);
    TextStyle fractionStyle =
        this.fractionStyle ?? const TextStyle(fontSize: 12.0);
    String numString = number.toString();
    int index = numString.indexOf(".");

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(index != -1 ? numString.substring(0, index) : numString,
              style: intStyle),
          index != -1
              ? Text(numString.substring(index, numString.length),
                  style: fractionStyle)
              : Container()
        ],
      ),
    );
  }
}
