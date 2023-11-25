import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/loading.dart';
import '../../../common/views/widgets/tile_card.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/cart_guess_controller.dart';

class CartGuessView extends GetView<CartGuessController> {
  const CartGuessView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(ScreenAdapter.width(30)),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 5,
              mainAxisSpacing: ScreenAdapter.width(30),
              crossAxisSpacing: ScreenAdapter.width(30),
            ),
            itemCount: state?.length,
            itemBuilder: (context, index) => TileCard(
                padding: EdgeInsets.all(ScreenAdapter.width(30)),
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
                trailing: Text("￥${state?[index].price}",
                    style: TextStyle(fontSize: ScreenAdapter.fontSize(42))))),
        onLoading: const Loading(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
