import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:xmshop/app/utils/screen_adapter.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  int _countDown = 10;
  late Timer _timer;

  void initTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countDown <= 0 && timer.isActive) {
        timer.cancel();
        _widget = Container();
        return;
      }
      _countDown--;
    });
  }

  Widget _widget = Center(
      child: SpinKitThreeBounce(
          size: ScreenAdapter.width(50),
          itemBuilder: (context, index) => const DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black26, shape: BoxShape.circle))));

  @override
  Widget build(BuildContext context) {
    return _widget;
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
