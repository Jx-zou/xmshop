import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleBanner extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final IconData? subIcon;
  final double mainSize;
  final double secondSize;
  final GestureTapCallback? onSubTap;

  const TitleBanner(this.mainTitle,
      {super.key,
      this.subTitle = "",
      this.subIcon,
      this.onSubTap,
      this.mainSize = 48,
      this.secondSize = 38});

  onInit() {
    if (subIcon != null && subTitle.isNotEmpty) {
      throw Exception("图标与提示语不能同时存在.");
    }
  }

  Widget _subWidget() {
    if (subIcon != null) {
      return Icon(subIcon);
    } else {
      if (subTitle.isEmpty) {
        return Text(">", style: TextStyle(fontSize: secondSize));
      }
      return Text("$subTitle >", style: TextStyle(fontSize: secondSize));
    }
  }

  @override
  Widget build(BuildContext context) {
    onInit();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(mainTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: mainSize)),
        InkWell(
          onTap: onSubTap,
          child: _subWidget(),
        )
      ],
    );
  }
}
