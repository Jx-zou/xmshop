import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/routes.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/button/shape_button.dart';
import '../../../views/counter.dart';
import '../../../views/decimal.dart';
import '../../../views/close_bottom_sheet.dart';
import '../../../views/button/gradient_button.dart';
import '../../../views/check_box/image_check_box.dart';
import '../../../views/check_box/Image_check_box_list_tile.dart';
import '../../../models/cart_model.dart';
import '../../../views/select_wrap.dart';
import '../../../views/status/empty_view.dart';
import '../../../views/status/error_view.dart';
import '../../../views/status/loading_view.dart';
import '../../../views/tile.dart';
import '../controllers/cart_controller.dart';
import 'cart_bottom_view.dart';
import 'cart_guess_view.dart';

class CartBodyView extends GetView<CartController> {
  const CartBodyView({super.key});

  void _changeAttr(CartModel cartModel, int index) {
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
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32),
              ),
            ),
          ),
        ),
        child: ListView(children: [
          Tile(
            leading: Container(
              width: ScreenAdapter.width(256),
              height: ScreenAdapter.width(256),
              margin: EdgeInsets.only(right: ScreenAdapter.width(40)),
              padding: EdgeInsets.all(ScreenAdapter.width(25)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(12)),
                color: Colors.black.withOpacity(0.05),
              ),
              child: Image.network(
                HttpsClient.picReplaceUrl("${cartModel.pic}"),
                fit: BoxFit.fitHeight,
              ),
            ),
            title: Text(
              "￥${cartModel.price}",
              style: TextStyle(
                color: Colors.red,
                fontSize: ScreenAdapter.fontSize(56),
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              "${cartModel.title}  ${cartModel.selectedAttr?.values.join('  ')}",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(32),
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: ScreenAdapter.height(80)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: cartModel.attrs!
                .map(
                  (attr) => SelectWrap(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenAdapter.height(20)),
                    title: "${attr.cate}",
                    titleStyle: TextStyle(fontSize: ScreenAdapter.fontSize(35)),
                    itemCount: attr.list!.length,
                    itemBuilder: (context, index) =>
                        Row(mainAxisSize: MainAxisSize.min, children: [
                      ShapeButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenAdapter.width(40),
                          vertical: ScreenAdapter.height(16),
                        ),
                        color: cartModel.selectedAttr!
                                .containsValue(attr.list?[index])
                            ? Colors.redAccent.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        shape: StadiumBorder(
                          side: cartModel.selectedAttr!
                                  .containsValue(attr.list?[index])
                              ? const BorderSide(
                                  color: Colors.redAccent,
                                  strokeAlign: BorderSide.strokeAlignOutside)
                              : BorderSide.none,
                        ),
                        child: Text(
                          attr.list![index],
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: ScreenAdapter.fontSize(32),
                          ),
                        ),
                        onPressed: () {
                          controller.updateAttr(cartModel, index);
                        },
                      ),
                    ]),
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }

  Widget _storeItem(CartModel cartModel, int index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      child: ImageCheckBoxListTile(
        value: true,
        activeWidget: Image.asset(
          "assets/images/cart_checkbox_select_icon.png",
          width: ScreenAdapter.fontSize(56),
          height: ScreenAdapter.fontSize(56),
        ),
        unActiveWidget: Image.asset(
          "assets/images/cart_checkbox_unselect_icon.png",
          width: ScreenAdapter.fontSize(56),
          height: ScreenAdapter.fontSize(56),
        ),
        titleCrossAxisAlignment: CrossAxisAlignment.start,
        onChanged: (isChecked) {},
        onPressed: () {
          Routes.toProductDetails(cartModel.id);
        },
        leading: Container(
          width: ScreenAdapter.width(300),
          height: ScreenAdapter.width(300),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.02),
            borderRadius: BorderRadius.circular(ScreenAdapter.fontSize(30)),
            image: DecorationImage(
                image:
                    NetworkImage(HttpsClient.picReplaceUrl("${cartModel.pic}")),
                fit: BoxFit.fitHeight),
          ),
        ),
        title: Text(
          "${cartModel.title}",
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
              _changeAttr(cartModel, index);
            },
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "${cartModel.selectedAttr}",
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
              cartModel.price?.toDouble(),
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
            count: cartModel.count,
            left: Image.asset(
              "assets/images/add_icon.png",
              width: ScreenAdapter.fontSize(20),
              height: ScreenAdapter.fontSize(20),
            ),
            right: Image.asset(
              "assets/images/reduce_icon.png",
              width: ScreenAdapter.fontSize(20),
              height: ScreenAdapter.fontSize(20),
            ),
            decoration: ModifyDecoration.rtl,
            shape: const StadiumBorder(side: BorderSide(color: Colors.black12)),
            countBorder: const Border.symmetric(
                vertical: BorderSide(color: Colors.black12)),
            onChange: (int count) {
              controller.updateCount(index, cartModel.count);
            },
          ),
        ]),
      ),
    );
  }

  Widget _store(String title, bool Function(CartModel) test,
      [Widget? trailing]) {
    List<Widget> storeItems = [];
    if (controller.state != null && controller.state!.isNotEmpty) {
      for (int i = 0; i < controller.state!.length; i++) {
        if (test(controller.state![i])) {
          storeItems.add(_storeItem(controller.state![i], i));
        }
      }
    }

    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          ImageCheckBox(
            value: controller.allSelected.value,
            onChanged: (value) {
              controller.changeAllSelected();
            },
            activeWidget: Image.asset(
              "assets/images/cart_checkbox_select_icon.png",
              width: 12.0,
              height: 12.0,
            ),
            unActiveWidget: Image.asset(
              "assets/images/cart_checkbox_unselect_icon.png",
              width: 12.0,
              height: 12.0,
            ),
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
                        (cart) => !cart.isExpire,
                        Row(children: [
                          Image.asset(
                            "assets/images/tips.png",
                            width: ScreenAdapter.fontSize(38),
                            height: ScreenAdapter.fontSize(38),
                            color: Colors.black26,
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
                      ),
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
                    child: _store("失效分组", (cart) => cart.isExpire),
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
