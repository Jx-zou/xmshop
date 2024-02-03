import 'package:flutter/material.dart';

enum ModifyDecoration { ltr, rtl }

typedef ModifyEnable = bool Function();
typedef CountChange = void Function(int count);

const double kMaxWidth = 80.0;
const double kMaxHeight = 40.0;

class Counter extends StatefulWidget {
  final CountChange onChange;
  final List<int>? flexes;
  final int count;
  final int? minCount;
  final int? maxCount;
  final double? width;
  final double? height;
  final ShapeBorder? shape;
  final ModifyDecoration decoration;
  final Widget left;
  final Widget right;
  final Color? color;
  final Color? countColor;
  final TextStyle? style;
  final BoxBorder? countBorder;
  final BorderRadiusGeometry? countBorderRadius;
  final double? countWidth;
  final double? countHeight;

  Counter({
    super.key,
    required this.onChange,
    required this.left,
    required this.right,
    this.flexes,
    this.count = 0,
    this.minCount,
    this.maxCount,
    this.width,
    this.height,
    this.countWidth,
    this.countHeight,
    this.shape,
    this.color,
    this.countColor,
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
    widget.onChange(_count);
  }

  void _decrementCount() {
    setState(() {
      _count--;
    });
    widget.onChange(_count);
  }

  bool _minJudgment() {
    return widget.minCount != null
        ? (_count == widget.minCount ? false : true)
        : true;
  }

  bool _maxJudgment() {
    return widget.maxCount != null
        ? (_count == widget.maxCount ? false : true)
        : true;
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

  Widget _modifyBox(ModifyEnable modifyEnable, Function tap, Widget widget) {
    bool enable = modifyEnable();
    return Center(
      child: InkResponse(
        onTap: () {
          if (enable) {
            tap();
          }
        },
        child: widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<int> flexes = widget.flexes ?? [1, 1, 1];

    Widget left = _modifyBox(_leftEnable, _leftModify, widget.left);
    Widget right = _modifyBox(_rightEnable, _rightModify, widget.right);

    Widget center = DecoratedBox(
      decoration: BoxDecoration(
        color: widget.countColor,
        border: widget.countBorder,
        borderRadius: widget.countBorderRadius,
      ),
      child: Center(
        child: Text("$_count", style: widget.style),
      ),
    );

    return Material(
      color: widget.color,
      shape: widget.shape,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: widget.width ?? kMaxWidth,
          height: widget.height ?? kMaxHeight,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Expanded(flex: flexes[0], child: left),
          Expanded(flex: flexes[1], child: center),
          Expanded(flex: flexes[2], child: right),
        ]),
      ),
    );
  }
}
