import 'package:flutter/material.dart';

enum ModifyDecoration { ltr, rtl }

typedef ModifyEnable = bool Function();
typedef CountChange = void Function(int count);

const double kMaxWidth = 80.0;
const double kMaxHeight = 40.0;

class Counter extends StatefulWidget {
  final CountChange onChange;
  final int count;
  final int? minCount;
  final int? maxCount;
  final double? width;
  final double? height;
  final ShapeBorder? shape;
  final ModifyDecoration decoration;
  final IconData? left;
  final IconData? right;
  final double iconSize;
  final Color? iconColor;
  final TextStyle? style;
  final BoxBorder? countBorder;
  final BorderRadiusGeometry? countBorderRadius;

  Counter({
    super.key,
    required this.onChange,
    this.count = 0,
    this.minCount,
    this.maxCount,
    this.width,
    this.height,
    this.shape,
    this.left,
    this.right,
    this.iconSize = 12,
    this.iconColor,
    this.style,
    this.countBorder,
    this.countBorderRadius,
    this.decoration = ModifyDecoration.ltr,
  }) {
    if (minCount != null && count < minCount!) {
      throw "count cannot be less than minCount";
    }
    if (maxCount != null && count > maxCount!) {
      throw "count cannot be greater than maxCount";
    }
  }

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late final VoidCallback _leftModify;
  late final VoidCallback _rightModify;
  late final ModifyEnable _leftEnable;
  late final ModifyEnable _rightEnable;
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
  }

  bool _minJudgment() {
    return widget.minCount != null ? (_count == widget.minCount ? false : true) : true;
  }

  bool _maxJudgment() {
    return widget.maxCount != null ? (_count == widget.maxCount ? false : true) : true;
  }

  void _init() {
    switch (widget.decoration) {
      case ModifyDecoration.ltr:
        _leftModify = _decrementCount;
        _leftEnable = _minJudgment;
        _rightModify = _incrementCount;
        _rightEnable = _maxJudgment;
        return;
      case ModifyDecoration.rtl:
        _leftModify = _incrementCount;
        _leftEnable = _maxJudgment;
        _rightModify = _decrementCount;
        _rightEnable = _minJudgment;
    }
  }

  @override
  void initState() {
    super.initState();
    _count = widget.count;
    _init();
  }

  Widget _modifyBox(ModifyEnable modifyEnable, Function tap, {IconData? icon}) {
    bool enable = modifyEnable();
    return Center(
      child: InkResponse(
        onTap: () {
          if (enable) {
            tap();
          }
        },
        child: Icon(
          icon,
          color: enable
              ? (widget.iconColor ?? Colors.black87)
              : Colors.black.withOpacity(0.02),
          size: widget.iconSize,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget left = _modifyBox(_leftEnable, _leftModify, icon: widget.left);

    Widget right = _modifyBox(_rightEnable, _rightModify, icon: widget.right);

    Widget center = DecoratedBox(
      decoration: BoxDecoration(
          border: widget.countBorder, borderRadius: widget.countBorderRadius),
      child: Center(
        child: Text("$_count", style: widget.style),
      ),
    );

    return Material(
      shape: widget.shape,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: widget.width ?? kMaxWidth,
            maxHeight: widget.height ?? kMaxHeight),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(child: left),
          Expanded(child: center),
          Expanded(child: right),
        ]),
      ),
    );
  }
}
