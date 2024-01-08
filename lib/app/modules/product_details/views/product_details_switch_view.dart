import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_shop_icons.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/close_bottom_sheet.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/text_tile.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsSwitchView extends GetView<ProductDetailsController> {
  const ProductDetailsSwitchView({super.key});

  Widget _textTile(String leading, Widget title, VoidCallback onPressed) {
    return TextTile(
      leading: leading,
      title: title,
      trailing: Container(
        padding: EdgeInsets.only(
          left: ScreenAdapter.width(30),
        ),
        child: Icon(
          XmShopIcons.arrowRight,
          size: ScreenAdapter.fontSize(30),
        ),
      ),
      leadingSize: ScreenAdapter.fontSize(32),
      leadingColor: Colors.black26,
      padding: EdgeInsets.only(
        bottom: ScreenAdapter.height(30),
      ),
      onTap: onPressed,
    );
  }

  Widget _module(Widget widget) {
    return Container(
      width: ScreenAdapter.width(1080),
      margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
      padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30), ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ScreenAdapter.width(20),
        ),
      ),
      child: widget,
    );
  }

  Widget _serviceTag(String title) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(
        XmShopIcons.safe,
        size: ScreenAdapter.fontSize(28),
      ),
      SizedBox(
        width: ScreenAdapter.width(10),
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: ScreenAdapter.fontSize(32), color: Colors.black26),
      ),
    ]);
  }

  void _changeAttr() {
    Get.bottomSheet(CloseBottomSheet(bottom: Padding(
      padding: EdgeInsets.symmetric(
        vertical: ScreenAdapter.width(20),
        horizontal: ScreenAdapter.width(30),
      ),
      child:
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Expanded(
          child: GradientButton(
            padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(40)),
            onPressed: () {
              controller.addCart();
            },
            gradient: LinearGradient(
                colors: [Colors.orange.withOpacity(0.5), Colors.orange]),
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
            child: Text(
              "加入购物车",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32),
              ),
            ),
          ),
        ),
        SizedBox(
          width: ScreenAdapter.width(50),
        ),
        Expanded(
          child: GradientButton(
            padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(40)),
            onPressed: () {
              controller.buy();
            },
            gradient: LinearGradient(colors: [
              Colors.deepOrange.withOpacity(0.5),
              Colors.redAccent
            ]),
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
            child: Text(
              "加入购物车",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32),
              ),
            ),
          ),
        ),
      ]),
    ), child: Container()));
  }

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Column(children: [
        _module(
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: ScreenAdapter.height(20),
                  ),
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
                      fontSize: ScreenAdapter.fontSize(64), color: Colors.red),
                ),
              ]),
              Text(
                "￥${state?.oldPrice}",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(42),
                  color: Colors.black26,
                  decorationColor: Colors.black26,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(
                top: ScreenAdapter.height(20),
              ),
              child: Text(
                "${state?.title}",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenAdapter.fontSize(56),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: ScreenAdapter.height(20),
              ),
              child: Text(
                "${state?.subTitle}",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenAdapter.fontSize(34),
                ),
              ),
            ),
          ]),
        ),
        _module(
          Column(children: [
            _textTile(
              "已选",
              Text(
                "${state?.title}  ${controller.selectedAttr.value}  X${controller.shopNum.value}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    color: Colors.black87),
              ),
              _changeAttr,
            ),
            _textTile(
              "配送",
              SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(
                          XmShopIcons.location,
                          size: ScreenAdapter.fontSize(30),
                        ),
                        Text(
                          "北京市 海淀区",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.black38),
                        ),
                      ]),
                      Row(children: [
                        Text(
                          "有现货",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.red),
                        ),
                        Icon(
                          XmShopIcons.warningCircle,
                          size: ScreenAdapter.fontSize(30),
                        ),
                        Text(
                          "今天20点前付款，预计1月8日送达",
                          style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(32),
                              color: Colors.black87),
                        ),
                      ]),
                    ]),
              ),
              () {
                Get.bottomSheet(CloseBottomSheet(child: Container()));
              },
            ),
            _textTile(
              "门店",
              Text(
                "定位失败，重新定位",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    color: Colors.black87),
              ),
              () {
                Get.bottomSheet(CloseBottomSheet(child: Container()));
              },
            ),
            _textTile(
              "服务",
              Wrap(
                spacing: ScreenAdapter.width(20),
                children: [
                  _serviceTag("小米自营"),
                  _serviceTag("小米发货"),
                  _serviceTag("7天无理由退货（到店自取拆封后不支持）"),
                ],
              ),
              () {
                Get.bottomSheet(CloseBottomSheet(child: Container()));
              },
            ),
          ]),
        ),
        SizedBox(
          height: ScreenAdapter.width(30),
        ),
      ]),
      onLoading: const LoadingView(),
          onEmpty: const EmptyView(),
          onError: (error) => const ErrorView(),
    );
  }
}
