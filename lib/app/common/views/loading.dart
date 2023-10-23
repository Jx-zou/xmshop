import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
            size: ScreenAdapter.width(50),
            itemBuilder: (context, index) => const DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.black26, shape: BoxShape.circle))));
  }
}