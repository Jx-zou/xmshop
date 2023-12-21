import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/views/status/loading_view.dart';

import '../../../common/utils/https_client.dart';
import '../../../common/utils/route_utils.dart';
import '../../../common/utils/screen_adapter.dart';
import '../../../views/tile_card.dart';
import '../controllers/product_details_recommended_controller.dart';

class ProductDetailsRecommendedView
    extends GetView<ProductDetailsRecommendedController> {
  const ProductDetailsRecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: EdgeInsets.only(
            left: ScreenAdapter.width(30),
          ),
          child: Text(
            "猜你喜欢",
            style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
                fontWeight: FontWeight.w600),
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(
            ScreenAdapter.width(30),
          ),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 5,
            mainAxisSpacing: ScreenAdapter.width(30),
            crossAxisSpacing: ScreenAdapter.width(30),
          ),
          itemCount: state?.length,
          itemBuilder: (context, index) => TileCard(
            onTap: () {
              RouteUtils.to("/product-details", "id", state?[index].id);
            },
            padding: EdgeInsets.all(
              ScreenAdapter.width(30),
            ),
            backgroundColor: Colors.white,
            image: Image.network(
              HttpsClient.picReplaceUrl("${state?[index].pic}"),
              fit: BoxFit.cover,
            ),
            title: "${state?[index].title}",
            titleStyle: TextStyle(
              fontSize: ScreenAdapter.fontSize(42),
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            subTitle: "${state?[index].subTitle}",
            subTitleStyle: TextStyle(
                fontSize: ScreenAdapter.fontSize(28),
                overflow: TextOverflow.ellipsis),
            trailing: Text(
              "￥${state?[index].price}",
              style: TextStyle(
                fontSize: ScreenAdapter.fontSize(42),
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenAdapter.height(30),
        ),
      ]),
      onLoading: LoadingView.threeBounce(),
      onEmpty: const SizedBox(),
      onError: (error) => const SizedBox(),
    );
  }
}
