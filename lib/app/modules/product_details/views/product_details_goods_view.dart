import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';
import '../../../common/views/pagination/rect_fraction_pagination_builder.dart';
import '../../../common/views/widgets/close_bottom_sheet.dart';
import '../../../common/views/widgets/round_rect_button.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/loading.dart';
import '../../../common/views/widgets/text_tile.dart';
import '../../../utils/screen_adapter.dart';
import '../../../utils/https_client.dart';

class ProductDetailsGoodsView extends GetView<ProductDetailsController> {
  const ProductDetailsGoodsView({super.key});

  Widget _textTile({required String leading, required Widget title, required Widget bottomSheet}) =>
      TextTile(
          leading: leading,
          title: title,
          trailing:
          Icon(XmshopIcons.arrowRight, size: ScreenAdapter.fontSize(30)),
          leadingSize: ScreenAdapter.fontSize(32),
          leadingColor: Colors.black26,
          padding: EdgeInsets.only(bottom: ScreenAdapter.height(30)),
          onTap: () {
            Get.bottomSheet(
                CloseBottomSheet(
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(1680),
                    icon: Icon(XmshopIcons.close,
                        size: ScreenAdapter.fontSize(20),
                        color: Colors.black87),
                    closed: () => Get.back(),
                    child: bottomSheet),
                isScrollControlled: true,
                elevation: 0);
          });

  Widget _module({required Widget widget}) =>
      Container(
          width: ScreenAdapter.width(1080),
          margin: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30), ScreenAdapter.width(30),
              ScreenAdapter.width(30), 0),
          padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(30), ScreenAdapter.width(30),
              ScreenAdapter.width(30), 0),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
          child: widget);

  Widget _serviceTag({required String title}) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(XmshopIcons.yes, size: ScreenAdapter.fontSize(28)),
        SizedBox(width: ScreenAdapter.width(10)),
        Text(title,
            style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32), color: Colors.black26))
      ]);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
            (state) =>
            Column(children: [
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(1200),
                child: Swiper(
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      Image.network(
                        HttpsClient.picReplaceUrl("${state?.pic}"),
                        fit: BoxFit.cover,
                        errorBuilder: (c, o, s) =>
                            Image.asset("assets/images/404mix.jpg"),
                      ),
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomRight,
                      builder: RectFractionPaginationBuilder(
                          backgroundColor: Colors.black26,
                          borderRadius: BorderRadius.circular(
                              ScreenAdapter.height(10)),
                          color: Colors.white,
                          activeColor: Colors.cyan,
                          width: ScreenAdapter.width(100),
                          height: ScreenAdapter.height(60),
                          fontSize: ScreenAdapter.fontSize(28),
                          activeFontSize: ScreenAdapter.fontSize(28))),
                ),
              ),
              _module(
                  widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: ScreenAdapter
                                      .height(20)),
                                  child: Text(
                                    "￥",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(28),
                                        color: Colors.red),
                                  ),
                                ),
                                Text(
                                  "${state?.price}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(64),
                                      color: Colors.red),
                                ),
                              ],
                            ),
                            Text(
                              "￥${state?.oldPrice}",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(42),
                                color: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: ScreenAdapter.height(20)),
                          child: Text("${state?.title}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenAdapter.fontSize(56))),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenAdapter.height(20)),
                          child: Text("${state?.subTitle}",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: ScreenAdapter.fontSize(34))),
                        ),
                      ])),
              _module(
                  widget: Column(children: [
                    _textTile(
                        leading: "已选",
                        title: SizedBox(
                            child: Text("${state?.title}  ${controller
                                .selectedAttr['selected']!.join(
                                '  ')}  X${controller.shopNum}",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(32),
                                    color: Colors.black87))),
                        bottomSheet: _SelectedBottomSheet()),
                    _textTile(
                        leading: "配送",
                        title: SizedBox(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Icon(XmshopIcons.location,
                                        size: ScreenAdapter.fontSize(30)),
                                    Text("贵州 贵阳市 观山湖区",
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                                32),
                                            color: Colors.black38))
                                  ]),
                                  Row(children: [
                                    Text("有现货",
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                                32),
                                            color: Colors.red)),
                                    Icon(XmshopIcons.exclamationMark,
                                        size: ScreenAdapter.fontSize(30)),
                                    Text("今天20点前付款，预计1月8日送达",
                                        style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                                32),
                                            color: Colors.black87))
                                  ])
                                ])),
                        bottomSheet: Container()),
                    _textTile(
                        leading: "门店",
                        title: Text("定位失败，重新定位",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                color: Colors.black87)),
                        bottomSheet: Container()),
                    _textTile(
                        leading: "服务",
                        title: Wrap(
                          spacing: ScreenAdapter.width(20),
                          children: [
                            _serviceTag(title: "小米自营"),
                            _serviceTag(title: "小米发货"),
                            _serviceTag(
                                title: "7天无理由退货（到店自取拆封后不支持）"),
                          ],
                        ),
                        bottomSheet: Container())
                  ])),
              SizedBox(height: ScreenAdapter.width(30))
            ]), onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}

class _SelectedBottomSheet extends GetView<ProductDetailsController> {
  Widget _bottomButton({String? title, required List<Color> colors, required VoidCallback onPressed}) =>
      Expanded(
          child: RoundRectButton(
              height: ScreenAdapter.height(125),
              margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
              gradient: LinearGradient(colors: colors),
              borderRadius: BorderRadius.circular(ScreenAdapter.height(80)),
              elevation: 0,
              onPressed: onPressed,
              child: Text("$title", style: const TextStyle(color: Colors.white))));

  @override
  Widget build(BuildContext context) {
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
                                                .contains(item)
                                                ? Colors.redAccent.withOpacity(
                                                0.1)
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
                            size: ScreenAdapter.fontSize(32))),
                  ],
                )
              ],
            )
          ]
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenAdapter.height(20),
                    horizontal: ScreenAdapter.width(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomButton(
                        onPressed: () {},
                        colors: [Colors.orange.withOpacity(0.5), Colors.orange],
                        title: "加入购物车"),
                    SizedBox(width: ScreenAdapter.width(20)),
                    _bottomButton(
                        onPressed: () {},
                        colors: [
                          Colors.deepOrange.withOpacity(0.5),
                          Colors.redAccent
                        ],
                        title: "立即购买"),
                  ],
                ),
              ))
        ]), onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
