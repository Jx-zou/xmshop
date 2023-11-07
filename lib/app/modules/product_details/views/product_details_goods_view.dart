import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/common/views/error_view.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../controllers/product_details_controller.dart';
import '../../../common/views/rect_fraction_pagination_builder.dart';
import '../../../common/views/text_tile.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsGoodsView extends GetView<ProductDetailsController> {
  const ProductDetailsGoodsView({super.key});

  Widget _textTile(
          {required String leading,
          required Widget title,
          required Widget bottomSheet}) =>
      TextTile(
          leading: leading,
          title: title,
          trailing:
              Icon(XmshopIcons.arrowRight, size: ScreenAdapter.fontSize(30)),
          leadingSize: ScreenAdapter.fontSize(32),
          leadingColor: Colors.black26,
          onTap: () {
            Get.bottomSheet(bottomSheet);
          });

  Widget _module({required Widget widget}) => Container(
      width: ScreenAdapter.width(1080),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30),
          ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
      padding: EdgeInsets.all(ScreenAdapter.height(30)),
      decoration: BoxDecoration(
          color: Colors.white,
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
        (state) => Column(children: [
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.height(815),
                child: Swiper(
                  itemCount: 7,
                  itemBuilder: (context, index) => Image.network(
                    "https://www.itying.com/images/flutter/p1.jpg",
                    fit: BoxFit.cover,
                  ),
                  pagination: SwiperPagination(
                      alignment: Alignment.bottomRight,
                      builder: RectFractionPaginationBuilder(
                          backgroundColor: Colors.black26,
                          borderRadius:
                              BorderRadius.circular(ScreenAdapter.height(10)),
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
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(20)),
                              child: Text(
                                "￥",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(28),
                                    color: Colors.red),
                              ),
                            ),
                            Text(
                              // "${state?.price}",
                              "12.9",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(64),
                                  color: Colors.red),
                            ),
                          ],
                        ),
                        Text(
                          // "${state?.oldPrice}",
                          "24.9",
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(42),
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough,
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: Text(
                          // "${state?.title}",
                          "漫步者TWS1 AIR主动降噪蓝牙耳机无线入耳式2023新款深度tws1pro",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.fontSize(56))),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                      child: Text(
                          // "${state?.subTitle}",
                          "漫步者TWS1 AIR主动降噪蓝牙耳机无线入耳式2023新款深度tws1pro",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: ScreenAdapter.fontSize(34))),
                    ),
                  ])),
              _module(
                  widget: Column(
                children: [
                  _textTile(
                      leading: "已选",
                      title: SizedBox(
                          child: Text("定制冰箱除味蛋 粉色 X1",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(32),
                                  color: Colors.black87))),
                      bottomSheet: Container()),
                  _textTile(
                      leading: "配送",
                      title: SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Row(
                              children: [
                                Icon(XmshopIcons.location,
                                    size: ScreenAdapter.fontSize(30)),
                                Text("贵州 贵阳市 观山湖区",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(32),
                                        color: Colors.black38))
                              ],
                            ),
                            Row(children: [
                              Text("有现货",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(32),
                                      color: Colors.red)),
                              Icon(XmshopIcons.exclamationMark,
                                  size: ScreenAdapter.fontSize(30)),
                              Text("今天20点前付款，预计1月8日送达",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(32),
                                      color: Colors.black87))
                            ])
                          ])),
                      bottomSheet: Container()),
                  _textTile(
                      leading: "门店",
                      title: SizedBox(
                          child: Text("定位失败，重新定位",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(32),
                                  color: Colors.black87))),
                      bottomSheet: Container()),
                  _textTile(
                      leading: "服务",
                      title: Wrap(
                        spacing: ScreenAdapter.width(20),
                        children: [
                          _serviceTag(title: "小米自营"),
                          _serviceTag(title: "小米发货"),
                          _serviceTag(title: "7天无理由退货（到店自取拆封后不支持）"),
                        ],
                      ),
                      bottomSheet: Container()),
                  const SizedBox(height: 10)
                ],
              )),
            ]),
        onLoading: Container(
            alignment: Alignment.center,
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.width(2400),
            child: const SizedBox(child: CircularProgressIndicator())),
        onEmpty: _errorView(),
        onError: (error) => _errorView());
  }

  _errorView() {
    return ErrorView("该页面丢了~",
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.width(2400),
        tagSize: ScreenAdapter.fontSize(46),
        tagColor: Colors.black54);
  }
}
