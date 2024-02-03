import 'package:flutter/material.dart';

const int _kIndeterminateLinearDuration = 1800;

class LinearInsideIndicator extends StatefulWidget {
  final int count;
  final int active;
  final Color? color;
  final Color? activeColor;
  final BorderRadiusGeometry? borderRadius;
  final Duration? duration;

  const LinearInsideIndicator({
    super.key,
    required this.count,
    required this.active,
    this.color,
    this.activeColor,
    this.borderRadius,
    this.duration,
  });

  @override
  State<LinearInsideIndicator> createState() => _LinearInsideIndicatorState();
}

class _LinearInsideIndicatorState extends State<LinearInsideIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  Widget buildSlideTransition() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return SlideTransition(
        position: _animation,
        child: Container(
          width: constraints.maxWidth / widget.count,
          decoration: BoxDecoration(
            color: widget.activeColor,
            borderRadius: widget.borderRadius,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    _animation = Tween(begin: Offset((widget.active - 1), 0), end: Offset(widget.active.toDouble(), 0)).animate(_animationController);
    return Container(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: double.infinity,
      ),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadius,
      ),
      child: buildSlideTransition(),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(milliseconds: _kIndeterminateLinearDuration),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
