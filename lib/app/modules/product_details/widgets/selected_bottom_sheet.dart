import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/loading.dart';
import '../../../common/views/widgets/round_rect_button.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_details_controller.dart';

class SelectedBottomSheet extends GetView<ProductDetailsController> {
  final Widget? bottom;

  const SelectedBottomSheet({super.key, this.bottom});

  @override
  Widget build(BuildContext context) {
    Widget bottom = this.bottom ?? Container();
    return controller.obx((state) =>
        Stack(children: [
          ListView(children: [
            Row(children: [
              Container(
                  width: ScreenAdapter.width(256),
                  height: ScreenAdapter.width(256),
                  margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
                  padding: EdgeInsets.all(ScreenAdapter.width(25)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ScreenAdapter.fontSize(12)),
                    color: Colors.black.withOpacity(0.05),
                  ),
                  child: Image.network(
                    HttpsClient.picReplaceUrl("${state?.pic}"),
                    fit: BoxFit.cover,
                  )),
              Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Text("￥${state?.price}",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: ScreenAdapter.fontSize(56),
                                  fontWeight: FontWeight.w500)),
                          SizedBox(width: ScreenAdapter.width(20)),
                          Text("￥${state?.oldPrice}",
                              style: TextStyle(
                                  color: Colors.black26,
                                  fontSize: ScreenAdapter.fontSize(32),
                                  decoration: TextDecoration.lineThrough))
                        ]),
                        SizedBox(height: ScreenAdapter.width(40)),
                        Text("${state?.title}  ${controller
                            .selectedAttr['selected']!.join('  ')}",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                color: Colors.black87))
                      ]))
            ]),
            SizedBox(height: ScreenAdapter.height(80)),
            ...?state?.attr?.map((attr) =>
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${attr.cate}",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(35))),
                      SizedBox(height: ScreenAdapter.height(30)),
                      Wrap(
                          spacing: ScreenAdapter.width(30),
                          children: attr.list!.map((item) =>
                              Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(() =>
                                        RoundRectButton(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: ScreenAdapter.width(
                                                    40),
                                                vertical: ScreenAdapter.height(
                                                    16)),
                                            color: controller
                                                .selectedAttr['selected']!
                                                .contains(item) ? Colors
                                                .redAccent.withOpacity(0.1)
                                                : Colors.black.withOpacity(
                                                0.05),
                                            borderRadius: BorderRadius.circular(
                                                ScreenAdapter.fontSize(40)),
                                            elevation: 0,
                                            border: controller
                                                .selectedAttr['selected']!
                                                .contains(item) ? Border.all(
                                                color: Colors.redAccent,
                                                strokeAlign: BorderSide
                                                    .strokeAlignOutside) : null,
                                            child: Text(
                                                item,
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: ScreenAdapter
                                                        .fontSize(32))
                                            ),
                                            onPressed: () {
                                              controller.changeAttrSelected(
                                                  attr.cate, item);
                                            }))
                                  ])).toList()),
                      SizedBox(height: ScreenAdapter.height(40))
                    ])),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("购买数量",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(35))),
                  Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.shopNumSubtract();
                            },
                            icon: Icon(XmshopIcons.subtract,
                                color: Colors.black45,
                                size: ScreenAdapter.fontSize(32))),
                        Container(
                          width: ScreenAdapter.width(150),
                          height: ScreenAdapter.height(70),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.black12),
                          child: Text("${controller.shopNum}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(42),
                                  color: Colors.white)),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.shopNumAdd();
                            },
                            icon: Icon(XmshopIcons.add,
                                color: Colors.black45,
                                size: ScreenAdapter.fontSize(32)))
                      ]
                  )
                ]
            )
          ]
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: bottom)
        ]),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
