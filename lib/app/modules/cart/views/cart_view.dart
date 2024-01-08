import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../controllers/cart_controller.dart';

import 'cart_body_view.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "购物车",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: ScreenAdapter.fontSize(48),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "编辑",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(42),
                  color: Colors.black87,
                ),
              ),
            ),
          ]),
      body: const CartBodyView(),
    );
  }
}
