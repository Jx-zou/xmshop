import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/screen_adapter.dart';
import '../../../views/close_bottom_sheet.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/tile.dart';
import '../controllers/product_details_controller.dart';
import 'product_details_attr_view.dart';

class ProductDetailsSwitchView extends GetView<ProductDetailsController> {
  const ProductDetailsSwitchView({super.key});

  Widget _tile(String leading, Widget title, VoidCallback onPressed) {
    return Tile(
      leading: Text(
        leading,
        style: TextStyle(
            fontSize: ScreenAdapter.fontSize(32), color: Colors.black26),
      ),
      title: title,
      trailing: Image.asset(
        "assets/images/arrow_right.png",
        width: ScreenAdapter.fontSize(30),
        height: ScreenAdapter.fontSize(30),
      ),
      padding: EdgeInsets.only(bottom: ScreenAdapter.height(30)),
      onPressed: onPressed,
    );
  }

  Widget _module(Widget widget) {
    EdgeInsetsGeometry spacing = EdgeInsets.fromLTRB(ScreenAdapter.width(30),
        ScreenAdapter.width(30), ScreenAdapter.width(30), 0);
    return Container(
      width: ScreenAdapter.width(1080),
      margin: spacing,
      padding: spacing,
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
      Image.asset(
        "assets/images/service_icon.png",
        width: ScreenAdapter.fontSize(28),
        height: ScreenAdapter.fontSize(28),
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
    Get.bottomSheet(
      CloseBottomSheet(
        close: Image.asset("assets/images/modal_close.png",
            width: 8.0, height: 8.0),
        closed: () {
          Get.back();
        },
        bottom:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: GradientButton(
              onPressed: () {
                controller.addCart();
                Get.back();
              },
              padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(40)),
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
          SizedBox(width: ScreenAdapter.width(50)),
          Expanded(
            child: GradientButton(
              onPressed: () {
                controller.buy();
                Get.back();
              },
              padding: EdgeInsets.symmetric(vertical: ScreenAdapter.width(40)),
              gradient: LinearGradient(colors: [
                Colors.deepOrange.withOpacity(0.5),
                Colors.redAccent
              ]),
              borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
              child: Text(
                "立即购买",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(32),
                ),
              ),
            ),
          ),
        ]),
        child: const ProductDetailsAttrView(),
      ),
      isScrollControlled: true,
    );
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
            _tile(
              "已选",
              Text(
                "${state?.title}  ${controller.selectedAttr?.values.join("  ")}  X${controller.shopNum.value}",
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    color: Colors.black87),
              ),
              () {
                _changeAttr();
              },
            ),
            _tile(
              "配送",
              SizedBox(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Image.asset(
                          "assets/images/icon_location.png",
                          width: ScreenAdapter.fontSize(30),
                          height: ScreenAdapter.fontSize(30),
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
                        Image.asset(
                          "assets/images/delivery_info_icon.png",
                          width: ScreenAdapter.fontSize(30),
                          height: ScreenAdapter.fontSize(30),
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
            _tile(
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
            _tile(
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
