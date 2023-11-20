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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: EdgeInsets.only(left: ScreenAdapter.width(30)),
        child: Text("猜你喜欢",
            style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
                fontWeight: FontWeight.w600)),
      ),
      controller.obx((state) => GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(ScreenAdapter.width(30)),
          shrinkWrap: true,
          childAspectRatio: 3 / 5,
          crossAxisCount: 2,
          mainAxisSpacing: ScreenAdapter.width(30),
          crossAxisSpacing: ScreenAdapter.width(30),
          children: state!
              .map((goodsModel) => TileCard(
                  padding: EdgeInsets.all(ScreenAdapter.width(30)),
                  backgroundColor: Colors.white,
                  image: Image.network(
                    HttpsClient.picReplaceUrl("${goodsModel.pic}"),
                    fit: BoxFit.cover,
                  ),
                  title: "${goodsModel.title}",
                  titleStyle: TextStyle(
                    fontSize: ScreenAdapter.fontSize(42),
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subTitle: "${goodsModel.subTitle}",
                  subTitleStyle: TextStyle(
                      fontSize: ScreenAdapter.fontSize(28),
                      overflow: TextOverflow.ellipsis),
                  trailing: Text("￥${goodsModel.price}",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(42)))))
              .toList())),
      SizedBox(height: ScreenAdapter.height(30))
    ]);
  }
}
