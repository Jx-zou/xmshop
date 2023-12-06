import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/status/loading_view.dart';
import '../../../common/views/widgets/text_tile.dart';
import '../../../utils/bottom_sheet_utils.dart';
import '../../../utils/screen_adapter.dart';
import '../../../widgets/bottom_button.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_swiper_view.dart';

class ProductDetailsSwitchView extends GetView<ProductDetailsController> {
  const ProductDetailsSwitchView({super.key});

  Widget _textTile({required String leading, required Widget title, required VoidCallback onTap}) =>
      TextTile(
          leading: leading,
          title: title,
          trailing: Icon(XmshopIcons.arrowRight, size: ScreenAdapter.fontSize(30)),
          leadingSize: ScreenAdapter.fontSize(32),
          leadingColor: Colors.black26,
          padding: EdgeInsets.only(bottom: ScreenAdapter.height(30)),
          onTap: onTap);

  Widget _module({required Widget widget}) => Container(
      width: ScreenAdapter.width(1080),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
      child: widget);

  Widget _serviceTag({required String title}) =>
      Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(XmshopIcons.safe, size: ScreenAdapter.fontSize(28)),
        SizedBox(width: ScreenAdapter.width(10)),
        Text(title, style: TextStyle(fontSize: ScreenAdapter.fontSize(32), color: Colors.black26))
      ]);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Column(children: [
              const ProductDetailsSwiperView(),
              _module(
                  widget: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
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
                              "${state?.price}",
                              style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(64),
                                  color: Colors.red),
                            )
                          ]),
                          Text("￥${state?.oldPrice}",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(42),
                                color: Colors.black26,
                                decorationColor: Colors.black26,
                                decoration: TextDecoration.lineThrough,
                              ))
                        ]),
                    Container(
                        padding: EdgeInsets.only(top: ScreenAdapter.height(20)),
                        child: Text("${state?.title}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: ScreenAdapter.fontSize(56)))),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenAdapter.height(20)),
                        child: Text("${state?.subTitle}",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: ScreenAdapter.fontSize(34))))
                  ])),
              _module(
                  widget: Column(children: [
                _textTile(
                    leading: "已选",
                    title: Text(
                        "${state?.title}  ${controller.selectedAttr}  X${controller.shopNum}",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.black87)),
                    onTap: () {
                      BottomSheetUtils.goodsSelectedBottomSheet(
                          bottom: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenAdapter.width(20),
                                horizontal: ScreenAdapter.width(30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: BottomButton(
                                        onPressed: () {
                                          controller.addCart();
                                        },
                                        colors: [
                                          Colors.orange.withOpacity(0.5),
                                          Colors.orange
                                        ],
                                        title: "加入购物车")),
                                SizedBox(width: ScreenAdapter.width(50)),
                                Expanded(
                                    child: BottomButton(
                                        onPressed: () {
                                          controller.buy();
                                        },
                                        colors: [
                                          Colors.deepOrange.withOpacity(0.5),
                                          Colors.redAccent
                                        ],
                                        title: "立即购买")),
                              ],
                            ),
                          ),
                          close: (selectedAttr, shopNum) =>
                              controller.updateAttrs(selectedAttr, shopNum));
                    }),
                _textTile(
                    leading: "配送",
                    title: SizedBox(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Row(children: [
                            Icon(XmshopIcons.location,
                                size: ScreenAdapter.fontSize(30)),
                            Text("北京市 海淀区",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(32),
                                    color: Colors.black38))
                          ]),
                          Row(children: [
                            Text("有现货",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(32),
                                    color: Colors.red)),
                            Icon(XmshopIcons.warningCircle,
                                size: ScreenAdapter.fontSize(30)),
                            Text("今天20点前付款，预计1月8日送达",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(32),
                                    color: Colors.black87))
                          ])
                        ])),
                    onTap: () {
                      BottomSheetUtils.closeBottomSheet();
                    }),
                _textTile(
                    leading: "门店",
                    title: Text("定位失败，重新定位",
                        style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            color: Colors.black87)),
                    onTap: () {
                      BottomSheetUtils.closeBottomSheet();
                    }),
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
                    onTap: () {
                      BottomSheetUtils.closeBottomSheet();
                    })
              ])),
              SizedBox(height: ScreenAdapter.width(30))
            ]),
        onLoading: LoadingView.circle(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
