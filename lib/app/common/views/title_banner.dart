import 'package:flutter/material.dart';

class TitleBanner extends StatelessWidget {
  final String mainTitle;
  final String secondTitle;
  final double mainSize;
  final double secondSize;

  const TitleBanner(
      this.mainTitle,
      this.secondTitle,
      {super.key,
      this.mainSize = 48,
      this.secondSize = 38});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(mainTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mainSize)),
        Text("$secondTitle >",
            style: TextStyle(fontSize: secondSize))
      ],
    );
  }
}
