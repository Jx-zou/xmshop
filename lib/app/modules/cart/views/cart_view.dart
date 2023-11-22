import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/widgets/round_rect_button.dart';

import '../controllers/cart_controller.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/icon_check_box.dart';
import '../../../utils/screen_adapter.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  Widget _body() {
    return ListView(
      children: [],
    );
  }

  Widget _bottom() {
    return Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(190),
      padding: EdgeInsets.all(ScreenAdapter.width(30)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(
                  color: Colors.black12, width: ScreenAdapter.height(2)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconCheckBox(
                value: true,
                icon: XmshopIcons.checked,
                size: ScreenAdapter.fontSize(60),
                iconSize: ScreenAdapter.fontSize(34),
                onChanged: (isChecked) {},
                shape: BoxShape.circle,
                activeColor: Colors.white,
                unActiveColor: Colors.white,
                fillColor: Colors.deepOrange,
              ),
              SizedBox(
                width: ScreenAdapter.width(25),
              ),
              Text(
                "全选",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenAdapter.fontSize(38),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text("合计",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(38))),
                    Text("(不含运费):",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.black38)),
                    Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                      Row(
                        children: [
                          Text(
                            "￥",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                color: Colors.deepOrange),
                          ),
                          Text(
                            "98",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(48),
                                color: Colors.deepOrange),
                          ),
                        ],
                      ),
                      Text(
                        ".89",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.deepOrange),
                      )
                    ])
                  ]),
                  SizedBox(
                    height: ScreenAdapter.height(8),
                  ),
                  Row(
                    children: [
                      const Text("免运费",
                          style: TextStyle(color: Colors.black38)),
                      SizedBox(
                        width: ScreenAdapter.width(10),
                      ),
                      const Text("优惠:￥0.01",
                          style: TextStyle(color: Colors.black54)),
                      SizedBox(
                        width: ScreenAdapter.width(10),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Row(children: [
                            const Text("明细",
                                style: TextStyle(color: Colors.deepOrange)),
                            Icon(Icons.keyboard_arrow_down_outlined,
                                size: ScreenAdapter.fontSize(32),
                                color: Colors.deepOrange)
                          ]))
                    ],
                  )
                ],
              ),
              SizedBox(width: ScreenAdapter.width(15)),
              RoundRectButton(
                onPressed: () {},
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(50),
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(50),
                    ScreenAdapter.width(20)),
                borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(75)),
                gradient: LinearGradient(colors: [
                  Colors.deepOrange.withOpacity(0.7),
                  Colors.deepOrange
                ]),
                child: Text(
                  "结算(2)",
                  style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(48),
                      color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
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
                  fontSize: ScreenAdapter.fontSize(42), color: Colors.black87),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(),
        body: Stack(
          children: [
            _body(),
            Positioned(left: 0, right: 0, bottom: 0, child: _bottom()),
          ],
        ));
  }
}
