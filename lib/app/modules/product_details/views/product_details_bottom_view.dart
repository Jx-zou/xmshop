
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsBottomView extends GetView {
  const ProductDetailsBottomView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.only(left: ScreenAdapter.width(15), right: ScreenAdapter.width(10)),
          height: ScreenAdapter.height(160),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: ScreenAdapter.height(3), color: Colors.black12))),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                    right: ScreenAdapter.width(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(XmshopIcons.online, size: ScreenAdapter.width(60)),
                    Text(
                      "客服",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(28),
                          color: Colors.black54),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                    right: ScreenAdapter.width(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(XmshopIcons.collect, size: ScreenAdapter.width(60)),
                    Text(
                      "收藏",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(28),
                          color: Colors.black54),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: ScreenAdapter.width(30),
                    right: ScreenAdapter.width(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(XmshopIcons.shopCart, size: ScreenAdapter.width(60)),
                    Text(
                      "购物车",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(28),
                          color: Colors.black54),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    height: ScreenAdapter.height(125),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.orange.withOpacity(0.5), Colors.orange]),
                        borderRadius:
                        BorderRadius.circular(ScreenAdapter.height(80))),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(0)),
                      onPressed: () {},
                      child: const Text("加入购物车"),
                    ),
                  )),
              Expanded(
                  child: Container(
                    height: ScreenAdapter.height(125),
                    margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.deepOrange.withOpacity(0.7),
                          Colors.redAccent
                        ]),
                        borderRadius:
                        BorderRadius.circular(ScreenAdapter.height(80))),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          elevation: MaterialStateProperty.all(0)),
                      onPressed: () {},
                      child: const Text("立即购买"),
                    ),
                  ))
            ],
          ),
        ),
      );
    }


}