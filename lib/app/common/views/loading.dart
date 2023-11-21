import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10),() {
      _loading = false;
    });
    return _loading ? Center(
        child: SpinKitThreeBounce(
            size: ScreenAdapter.width(50),
            itemBuilder: (context, index) => const DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.black26, shape: BoxShape.circle)))) : Container();
  }
}
