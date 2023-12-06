import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatefulWidget {
  final Widget _loading;

  const LoadingView._(this._loading);

  static LoadingView threeBounce({double? size, Color? color, Duration? duration}) {
    return LoadingView._(SpinKitThreeBounce(
        size: size ?? 5,
        color: color,
        duration: duration ?? const Duration(milliseconds: 1000),
        itemBuilder: (context, index) => const DecoratedBox(
            decoration:
                BoxDecoration(color: Colors.black26, shape: BoxShape.circle))));
  }

  static LoadingView circle({double? size, Color? color, Duration? duration}) {
    return LoadingView._(SpinKitCircle(
        size: size ?? 5,
        color: color,
        duration: duration ?? const Duration(milliseconds: 1000),
        itemBuilder: (context, index) => const DecoratedBox(
            decoration:
            BoxDecoration(color: Colors.black26, shape: BoxShape.circle))));
  }

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 10), () {
      isLoading = false;
    });
    return isLoading ? Center(child: widget._loading) : Container();
  }
}
