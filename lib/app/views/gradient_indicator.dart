// import 'package:flutter/material.dart';
//
// class GradientIndicator extends StatefulWidget {
//   final Widget Function(double ratio) child;
//   final double maxSize;
//   final double currentSize;
//
//   const GradientIndicator({super.key, required this.child, required this.maxSize});
//
//   GradientIndicator.scroll({
//     super.key,
//     required this.child,
//     required ScrollController scrollController,
//     required this.maxSize,
//   }) {
//     scrollController.addListener(() {
//       scrollController.addListener(() {
//         if (scrollController.offset <= maxSize) {
//           ratio.value = scrollController.offset / maxSize;
//           return;
//         }
//         if (ratio.value != 1) {
//           ratio.value = 1;
//         }
//       });
//     });
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     return _GradientAppBarState();
//   }
// }
//
// class _GradientAppBarState extends State<GradientIndicator> {
//   double ratio = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child(ratio);
//   }
// }
