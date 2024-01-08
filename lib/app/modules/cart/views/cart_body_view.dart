import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../icons/xm_shop_icons.dart';
import '../../../utils/routes.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/counter.dart';
import '../../../views/decimal.dart';
import '../../../views/close_bottom_sheet.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/check_box/icon_check_box.dart';
import '../../../views/check_box/icon_check_box_list_tile.dart';
import '../../../models/cart_model.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../controllers/cart_controller.dart';
import 'cart_bottom_view.dart';
import 'cart_guess_view.dart';

class CartBodyView extends GetView<CartController> {
  const CartBodyView({super.key});

  void _changeAttr() {
    Get.bottomSheet(
      CloseBottomSheet(
        bottom: Padding(
          padding: EdgeInsets.all(ScreenAdapter.width(40)),
          child: GradientButton(
            padding: EdgeInsets.all(ScreenAdapter.width(40)),
            gradient: LinearGradient(
                colors: [Colors.deepOrange.withOpacity(0.5), Colors.redAccent]),
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(60)),
            onPressed: () {},
            child: Text(
              "确定",
              style: TextStyle(fontSize: ScreenAdapter.fontSize(32),
              ),
            ),
          ),
        ),
        child: Container(),
      ),
    );
  }

  Widget _storeItem({required CartModel cart}) {
    return Container(
        margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
        child: IconCheckBoxListTile(
          value: true,
          fillColor: Colors.deepOrange,
          icon: XmShopIcons.checked,
          titleCrossAxisAlignment: CrossAxisAlignment.start,
          onChanged: (isChecked) {},
          onTap: () {
            Routes.toProductDetails(cart.id);
          },
          leading: Container(
            width: ScreenAdapter.width(300),
            height: ScreenAdapter.width(300),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.02),
              borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(30)),
              image: DecorationImage(
                  image: NetworkImage(HttpsClient.picReplaceUrl("${cart.pic}")),
                  fit: BoxFit.fitHeight),
            ),
          ),
          title: Text(
            "${cart.title}",
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(48),
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          subTitle: Row(mainAxisSize: MainAxisSize.min, children: [
            GradientButton(
              color: Colors.black.withOpacity(0.02),
              padding: EdgeInsets.symmetric(
                horizontal: ScreenAdapter.width(15),
                vertical: ScreenAdapter.height(10),
              ),
              borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(20)),
              onPressed: () {
                _changeAttr();
              },
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "${cart.selectedAttr}",
                  style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(32),
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: ScreenAdapter.width(10)),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: ScreenAdapter.fontSize(32),
                ),
              ]),
            ),
          ]),
          secondary:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                "￥",
                style: TextStyle(
                  fontSize: ScreenAdapter.fontSize(36),
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              Decimal(
                cart.price?.toDouble(),
                height: ScreenAdapter.height(68),
                crossAxisAlignment: CrossAxisAlignment.end,
                intStyle: TextStyle(
                  fontSize: ScreenAdapter.fontSize(58),
                  color: Colors.deepOrange,
                ),
                fractionStyle: TextStyle(
                  fontSize: ScreenAdapter.fontSize(32),
                  color: Colors.deepOrange,
                ),
              ),
            ]),
            Counter(
              minCount: 0,
              count: cart.count,
              left: XmShopIcons.add,
              right: XmShopIcons.minus,
              decoration: ModifyDecoration.rtl,
              shape:
                  const StadiumBorder(side: BorderSide(color: Colors.black12)),
              countBorder: const Border.symmetric(
                  vertical: BorderSide(color: Colors.black12)),
              iconSize: ScreenAdapter.fontSize(20),
              onChange: (int count) {
                controller.modifyCount(cart.id, cart.selectedAttr, cart.count);
              },
            ),
          ]),
        ));
  }

  Widget _store(String title, Widget? trailing, List<CartModel>? carts) {
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
            fillColor: controller.allSelected.isTrue
                ? Colors.deepOrange
                : Colors.black.withOpacity(0.05),
            unActiveColor: Colors.transparent,
            activeColor: Colors.white,
            size: 18.0,
            iconSize: 12.0,
            icon: XmShopIcons.checked,
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenAdapter.width(20)),
            child: Text(
              title,
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                          BorderRadius.circular(ScreenAdapter.fontSize(40)),
                    ),
                    child: Column(children: [
                      _store(
                          "小米自营",
                          Row(children: [
                            Icon(
                              XmShopIcons.warningCircle,
                              color: Colors.black26,
                              size: ScreenAdapter.fontSize(38),
                            ),
                            SizedBox(width: ScreenAdapter.width(10)),
                            Text(
                              "已免运费",
                              style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                color: Colors.black26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]),
                          state?.where((cart) => !cart.isExpire).toList()),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.all(ScreenAdapter.width(30)),
                    padding: EdgeInsets.all(ScreenAdapter.width(30)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.fontSize(40)),
                    ),
                    child: _store(
                      "失效分组",
                      null,
                      controller.expire.map((index) => state![index]).toList(),
                    ),
                  ),
                ]),
            onLoading: const LoadingView(),
            onEmpty: const EmptyView(),
            onError: (error) => const ErrorView()),
        const CartGuessView()
      ]),
      const Positioned(left: 0, right: 0, bottom: 0, child: CartBottomView()),
    ]);
  }
}
