import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart_guess_controller.dart';
import '../../../common/views/status/loading_view.dart';
import '../../../common/views/widgets/tile_card.dart';
import '../../../utils/https_client.dart';
import '../../../utils/route_utils.dart';
import '../../../utils/screen_adapter.dart';

class CartGuessView extends GetView<CartGuessController> {
  const CartGuessView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => Column(children: [
              Padding(
                  padding: EdgeInsets.only(top: ScreenAdapter.height(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: ScreenAdapter.width(30),
                            height: ScreenAdapter.height(2),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.transparent,
                              Colors.black87
                            ]))),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenAdapter.width(20)),
                            child: Text("猜你喜欢",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(42),
                                    fontWeight: FontWeight.bold))),
                        Container(
                            width: ScreenAdapter.width(30),
                            height: ScreenAdapter.height(2),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Colors.black87,
                              Colors.transparent
                            ])))
                      ])),
              GridView.builder(
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
                      onTap: () {
                        RouteUtils.to(
                            "/product-details", "id", state?[index].id);
                      },
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
                          style:
                              TextStyle(fontSize: ScreenAdapter.fontSize(42)))))
            ]),
        onLoading: LoadingView.circle(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
