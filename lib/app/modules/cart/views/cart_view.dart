import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CartView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
              child: Container())
        ],
      )
    );
  }
}
