import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

import '../../../models/cart_model.dart';
import '../../../utils/bottom_sheet_utils.dart';
import '../../../utils/https_client.dart';
import '../../../utils/route_utils.dart';
import '../../../utils/screen_adapter.dart';

import '../../../common/views/loading.dart';
import '../../../common/views/widgets/icon_check_box_List_tile.dart';
import '../../../common/views/widgets/num_view.dart';
import '../../../common/views/widgets/round_rect_button.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/icon_check_box.dart';

import 'cart_guess_view.dart';

class CartView extends GetView<CartController> {

  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("购物车", style: TextStyle(fontWeight: FontWeight.w700, fontSize: ScreenAdapter.fontSize(48))),
            centerTitle: true,
            elevation: 0,
            actions: [
              TextButton(
                  onPressed: () {},
                  child: Text("编辑", style: TextStyle(fontSize: ScreenAdapter.fontSize(42), color: Colors.black87)))
            ]),
        body: _Body());
  }
}

class _Body extends GetView<CartController> {

  Widget _storeItem({required CartModel cart}) {
    return Container(
        margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
        child: IconCheckBoxListTile(
            value: true,
            fillColor: Colors.deepOrange,
            icon: XmshopIcons.checked,
            titleCrossAxisAlignment: CrossAxisAlignment.start,
            onChanged: (isChecked) {},
            onTap: () {
              RouteUtils.toGoodsDetails("id", "${cart.id}");
            },
            leading: Container(
                width: ScreenAdapter.width(300),
                height: ScreenAdapter.width(300),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.02),
                    borderRadius:
                    BorderRadius.circular(ScreenAdapter.fontSize(30)),
                    image: DecorationImage(
                        image: NetworkImage(
                            HttpsClient.picReplaceUrl("${cart.pic}")),
                        fit: BoxFit.fitHeight))),
            title: Text("${cart.title}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(48),
                    fontWeight: FontWeight.bold,
                    color: Colors.black54)),
            subTitle: Row(mainAxisSize: MainAxisSize.min, children: [
              RoundRectButton(
                  color: Colors.black.withOpacity(0.02),
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(15),
                      ScreenAdapter.width(10),
                      ScreenAdapter.width(15),
                      ScreenAdapter.width(10)),
                  borderRadius:
                  BorderRadius.circular(ScreenAdapter.fontSize(20)),
                  onPressed: () {
                    BottomSheetUtils.goodsSelectedBottomSheet(
                        showNumWidget: false, onPressed: () {});
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Text("${cart.selectedAttr}",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            fontWeight: FontWeight.bold,
                            color: Colors.black54)),
                    SizedBox(width: ScreenAdapter.width(10)),
                    Icon(Icons.keyboard_arrow_down_outlined,
                        size: ScreenAdapter.fontSize(32))
                  ]))
            ]),
            secondary: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Text("￥",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            fontWeight: FontWeight.bold,
                            color: Colors.deepOrange)),
                    NumView(cart.price?.toDouble(),
                        height: ScreenAdapter.height(68),
                        crossAxisAlignment: CrossAxisAlignment.end,
                        intStyle: TextStyle(
                            fontSize: ScreenAdapter.fontSize(58),
                            color: Colors.deepOrange),
                        fractionStyle: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.deepOrange))
                  ]),
                  Row(children: [
                    RoundRectButton(
                        width: ScreenAdapter.width(80),
                        height: ScreenAdapter.width(70),
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(ScreenAdapter.fontSize(32))),
                        child: Icon(XmshopIcons.add,
                            size: ScreenAdapter.width(20)),
                        onPressed: () {
                          controller.addShopNum(cart.id, cart.selectedAttr);
                        }),
                    Container(
                        width: ScreenAdapter.width(80),
                        height: ScreenAdapter.width(70),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(color: Colors.black12))),
                        child: Text("${cart.count}")),
                    RoundRectButton(
                        width: ScreenAdapter.width(80),
                        height: ScreenAdapter.width(70),
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(ScreenAdapter.fontSize(32))),
                        child: Icon(XmshopIcons.minus,
                            size: ScreenAdapter.width(20),
                            color: cart.count > 1
                                ? Colors.black87
                                : Colors.black12),
                        onPressed: () {
                          controller.reduceShopNum(
                              cart.id, cart.selectedAttr, cart.count);
                        })
                  ])
                ])));
  }

  Widget _store({required String title, Widget? trailing, required List<CartModel>? carts}) {
    List<Widget> storeItems = [];
    if (carts != null && carts.isNotEmpty) {
      for (int i = 0; i < carts.length; i++) {
        storeItems.add(_storeItem(cart: carts[i]));
      }
    }

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          IconCheckBox(
              value: controller.allSelected.value,
              onChanged: (value) {
                controller.changeAllSelected();
              },
              fillColor: controller.allSelected.isTrue ? Colors.deepOrange : Colors.black.withOpacity(0.05),
              unActiveColor: Colors.transparent,
              activeColor: Colors.white,
              size: 18.0,
              iconSize: 12.0,
              icon: XmshopIcons.checked),
          Container(
              margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
              child: Text(title, style: TextStyle(fontSize: ScreenAdapter.fontSize(42), fontWeight: FontWeight.bold)))
        ]),
        trailing ?? Container()
      ]),
      ...storeItems
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(controller: controller.scrollController, children: [
      controller.obx(
            (state) => Column(children: [
          Container(
              margin: EdgeInsets.all(ScreenAdapter.width(30)),
              padding: EdgeInsets.all(ScreenAdapter.width(30)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(ScreenAdapter.fontSize(40))),
              child: Column(children: [
                _store(
                    title: "小米自营",
                    trailing: Row(children: [
                      Icon(XmshopIcons.warningCircle,
                          color: Colors.black26,
                          size: ScreenAdapter.fontSize(38)),
                      SizedBox(width: ScreenAdapter.width(10)),
                      Text("已免运费",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.black26,
                              fontWeight: FontWeight.w600))
                    ]),
                    carts: state?.where((cart) => !cart.isExpire).toList())
              ])),
          Container(
              margin: EdgeInsets.all(ScreenAdapter.width(30)),
              padding: EdgeInsets.all(ScreenAdapter.width(30)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(ScreenAdapter.fontSize(40))),
              child: _store(
                  title: "失效分组",
                  carts: controller.expire.map((index) => state![index]).toList()))
        ]),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container(),
      ),
      const CartGuessView()
    ]),
    Positioned(left: 0, right: 0, bottom: 0, child: _BodyBottom())
    ]);
  }
}

class _BodyBottom extends GetView<CartController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(190),
        padding: EdgeInsets.all(ScreenAdapter.width(30)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    color: Colors.black12, width: ScreenAdapter.height(2)))),
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Obx(() => IconCheckBox(
                value: controller.allSelected.value,
                icon: XmshopIcons.checked,
                size: ScreenAdapter.fontSize(56),
                iconSize: ScreenAdapter.fontSize(40),
                onChanged: (isChecked) {
                  controller.changeAllSelected();
                },
                shape: BoxShape.circle,
                activeColor: Colors.white,
                unActiveColor: Colors.transparent,
                fillColor: controller.allSelected.isTrue
                    ? Colors.deepOrange
                    : Colors.black.withOpacity(0.05),
              )),
              SizedBox(width: ScreenAdapter.width(25)),
              Text(
                "全选",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: ScreenAdapter.fontSize(42),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    Text("合计",
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(38))),
                    Text("(不含运费):",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.black38)),
                    Row(children: [
                      Text("￥",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.deepOrange)),
                      Obx(() => NumView(controller.totalPrice.value,
                          height: ScreenAdapter.height(61),
                          crossAxisAlignment: CrossAxisAlignment.end,
                          intStyle: TextStyle(
                              fontSize: ScreenAdapter.fontSize(46),
                              color: Colors.deepOrange),
                          fractionStyle: TextStyle(
                              fontSize: ScreenAdapter.fontSize(28),
                              color: Colors.deepOrange)))
                    ])
                  ]),
                  // Row(children: [
                  //   const Text("免运费", style: TextStyle(color: Colors.black38)),
                  //   SizedBox(width: ScreenAdapter.width(10)),
                  //   const Text("优惠:￥0.01",
                  //       style: TextStyle(color: Colors.black54)),
                  //   SizedBox(width: ScreenAdapter.width(10)),
                  //   InkWell(
                  //       onTap: () {},
                  //       child: Row(children: [
                  //         const Text("明细",
                  //             style: TextStyle(color: Colors.deepOrange)),
                  //         Icon(Icons.keyboard_arrow_down_outlined,
                  //             size: ScreenAdapter.fontSize(32),
                  //             color: Colors.deepOrange)
                  //       ]))
                  // ])
                ]),
            SizedBox(width: ScreenAdapter.width(15)),
            RoundRectButton(
                onPressed: () {},
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(54),
                    ScreenAdapter.width(20),
                    ScreenAdapter.width(54),
                    ScreenAdapter.width(20)),
                borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(75)),
                gradient: LinearGradient(colors: [
                  Colors.deepOrange.withOpacity(0.7),
                  Colors.deepOrange
                ]),
                child: Obx(() => Text("结算${controller.total.value}",
                    style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(48),
                        color: Colors.white))))
          ])
        ]));
  }
}