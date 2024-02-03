import 'package:flutter/material.dart';

import '../../../utils/screen_adapter.dart';

class HomeQaBannerView extends StatelessWidget {
  const HomeQaBannerView({super.key});

  Widget _checkTitle(String title) {
    return Row(children: [
      Image.asset(
        "assets/images/qa_check.png",
        width: ScreenAdapter.fontSize(42),
        height: ScreenAdapter.fontSize(42),
      ),
      const SizedBox(width: 5.0),
      Text(
        title,
        style: TextStyle(
          fontSize: ScreenAdapter.fontSize(36),
          color: Colors.black26,
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(30)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _checkTitle("官方商城"),
        _checkTitle("正品保障"),
        _checkTitle("售后无忧"),
      ]),
    );
  }
}
