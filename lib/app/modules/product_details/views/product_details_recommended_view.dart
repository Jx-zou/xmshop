import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_details_recommended_controller.dart';
import '../../../common/views/widgets/tile_card.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';

class ProductDetailsRecommendedView
    extends GetView<ProductDetailsRecommendedController> {
  const ProductDetailsRecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(ScreenAdapter.width(30)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("猜你喜欢",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
                fontWeight: FontWeight.w600
              )),
          controller.obx((state) => GridView.builder(
              shrinkWrap: true,
              itemCount: state!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenAdapter.width(30),
                  crossAxisSpacing: ScreenAdapter.width(30)),
              itemBuilder: (context, index) => TileCard(
                  image: NetworkImage(
                      HttpsClient.picReplaceUrl("${state[index].pic}")),
                  title: "${state[index].title}",
                  subTitle: "${state[index].subTitle}",
                  trailing: Text("${state[index].price}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(42))))))
        ]));
  }
}
