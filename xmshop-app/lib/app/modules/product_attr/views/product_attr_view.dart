import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/goods_details_model.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../../../views/button/shape_button.dart';
import '../../../views/counter.dart';
import '../../../views/select_wrap.dart';
import '../../../views/tile.dart';
import '../controllers/product_attr_controller.dart';

class ProductAttrView extends GetView<ProductAttrController> {
  final List<GoodsDetailsAttrModel>? attrs;
  final Map<String, String>? selectedAttr;
  final int? shopNum;
  final String? id;
  final String? title;
  final String? pic;
  final num? price;
  final num? oldPrice;
  final bool showCounter;

  const ProductAttrView({
    this.attrs,
    this.selectedAttr,
    this.shopNum,
    this.id,
    this.pic,
    this.price,
    this.oldPrice,
    this.title,
    this.showCounter = true,
    super.key,
  });

  Widget _counter() {
    return showCounter
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "购买数量",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(35),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(80)),
              child: Counter(
                flexes: const [2, 3, 2],
                countBorderRadius:
                    BorderRadius.circular(ScreenAdapter.fontSize(15)),
                countColor: Colors.black.withOpacity(0.05),
                width: ScreenAdapter.width(300),
                height: ScreenAdapter.height(80),
                countWidth: ScreenAdapter.width(200),
                color: Colors.white,
                left: Image.asset(
                  "assets/images/reduce_icon.png",
                  width: ScreenAdapter.fontSize(26),
                  height: ScreenAdapter.fontSize(26),
                  color: Colors.black38,
                ),
                right: Image.asset(
                  "assets/images/add_icon.png",
                  width: ScreenAdapter.fontSize(26),
                  height: ScreenAdapter.fontSize(26),
                  color: Colors.black38,
                ),
                count: shopNum ?? 1,
                minCount: 1,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenAdapter.fontSize(48)),
                onChange: (count) {
                  controller.updateShopNum(count);
                },
              ),
            ),
          ])
        : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    print(pic);
    controller.initSelectedAttr(attrs);
    return Obx(
      () => ListView(children: [
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
              HttpsClient.picReplaceUrl("$pic"),
              fit: BoxFit.fitHeight,
            ),
          ),
          title: Row(children: [
            Text(
              "￥$price",
              style: TextStyle(
                color: Colors.red,
                fontSize: ScreenAdapter.fontSize(56),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: ScreenAdapter.width(30)),
            Text(
              "￥$oldPrice",
              style: TextStyle(
                color: Colors.black26,
                fontSize: ScreenAdapter.fontSize(32),
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ]),
          subtitle: Text(
            "$title  ${selectedAttr?.values.join('  ')}",
            style: TextStyle(
              fontSize: ScreenAdapter.fontSize(32),
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: ScreenAdapter.height(80)),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: attrs!
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
                          color: selectedAttr!.containsValue(attr.list?[index])
                              ? Colors.redAccent.withOpacity(0.1)
                              : Colors.black.withOpacity(0.05),
                          shape: StadiumBorder(
                            side: selectedAttr!.containsValue(attr.list?[index])
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
                            controller.updateSelectedAttr(
                                attr.cate, attr.list?[index]);
                          })
                    ]),
                  ),
                )
                .toList()),
        _counter(),
      ]),
    );
  }
}
