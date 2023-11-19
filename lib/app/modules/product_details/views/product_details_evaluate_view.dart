import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/widgets/round_rect_button.dart';
import '../../../modules/product_details/controllers/product_details_controller.dart';
import '../../../common/icons/xmshop_icons.dart';
import '../../../common/views/widgets/title_banner.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsEvaluateView extends GetView<ProductDetailsController> {
  const ProductDetailsEvaluateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenAdapter.width(1080),
        margin: EdgeInsets.fromLTRB(ScreenAdapter.width(30), 0,
            ScreenAdapter.width(30), ScreenAdapter.width(30)),
        padding: EdgeInsets.fromLTRB(ScreenAdapter.width(30),
            ScreenAdapter.width(30), ScreenAdapter.width(30), 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleBanner(
              "买家秀",
              right: "共有54w+条评论",
              icon: XmshopIcons.arrowRight,
              iconColor: Colors.black87,
              leftSize: ScreenAdapter.fontSize(42),
              rightSize: ScreenAdapter.fontSize(32),
            ),
            SizedBox(height: ScreenAdapter.height(30)),
            Wrap(
              spacing: ScreenAdapter.width(30),
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RoundRectButton(
                        borderRadius:
                            BorderRadius.circular(ScreenAdapter.fontSize(10)),
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenAdapter.width(20),
                            vertical: ScreenAdapter.height(5)),
                        color: Colors.deepOrangeAccent.withOpacity(0.2),
                        child: Text(
                          "价格实惠",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(38)),
                        ),
                        onPressed: () {})
                  ],
                )
              ],
            ),
            SizedBox(height: ScreenAdapter.height(30)),
            SizedBox(
              height: ScreenAdapter.height(222.5),
              child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: ScreenAdapter.width(30),
                      crossAxisSpacing: ScreenAdapter.width(30),
                      crossAxisCount: 1,
                      childAspectRatio: 1 / 1),
                  itemBuilder: (context, index) => InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(
                                ScreenAdapter.fontSize(20)),
                            image: DecorationImage(
                                image: NetworkImage(controller.picList[index]),
                                fit: BoxFit.cover)),
                      ))),
            ),
            Divider(height: ScreenAdapter.height(100)),
            TitleBanner(
              "问大家",
              right: "共143个回答",
              icon: XmshopIcons.arrowRight,
              iconColor: Colors.black87,
              leftSize: ScreenAdapter.fontSize(42),
              rightSize: ScreenAdapter.fontSize(32),
            ),
            SizedBox(height: ScreenAdapter.height(30)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: ScreenAdapter.width(15)),
                          padding: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(7),
                              ScreenAdapter.width(3),
                              ScreenAdapter.width(5),
                              ScreenAdapter.width(5)),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      ScreenAdapter.fontSize(15)),
                                  topRight: Radius.circular(
                                      ScreenAdapter.fontSize(15)),
                                  bottomLeft: Radius.circular(
                                      ScreenAdapter.fontSize(15)))),
                          child: Text(
                            "问",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(28),
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      Text("有塑料味吗？",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(34)))
                    ]),
                    Text(
                      "6个回答",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(height: ScreenAdapter.height(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisSize: MainAxisSize.min, children: [
                      Container(
                          margin:
                              EdgeInsets.only(right: ScreenAdapter.width(15)),
                          padding: EdgeInsets.fromLTRB(
                              ScreenAdapter.width(7),
                              ScreenAdapter.width(3),
                              ScreenAdapter.width(5),
                              ScreenAdapter.width(5)),
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      ScreenAdapter.fontSize(15)),
                                  topRight: Radius.circular(
                                      ScreenAdapter.fontSize(15)),
                                  bottomLeft: Radius.circular(
                                      ScreenAdapter.fontSize(15)))),
                          child: Text(
                            "问",
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(28),
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      Text("C1按键失灵了，如何处理？",
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(34)))
                    ]),
                    Text(
                      "11个回答",
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(34),
                          color: Colors.black54),
                    )
                  ],
                ),
                SizedBox(height: ScreenAdapter.height(30))
              ],
            )
          ],
        ));
  }
}
