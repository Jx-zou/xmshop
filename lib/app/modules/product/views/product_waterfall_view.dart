import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/views/status/loading_view.dart';
import '../../../utils/https_client.dart';
import '../../../utils/screen_adapter.dart';
import '../controllers/product_controller.dart';

class ProductWaterfallView extends GetView<ProductController> {
  const ProductWaterfallView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenAdapter.width(30)),
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    itemCount: state!.length,
                    itemBuilder: (context, index) => Column(children: [
                          InkWell(
                              onTap: (){
                                  controller.toDetails(state[index].id);
                                },
                              child: Container(
                                  margin: EdgeInsets.only(top: ScreenAdapter.height(30)),
                                  padding: EdgeInsets.fromLTRB(
                                      ScreenAdapter.width(30),
                                      ScreenAdapter.height(50),
                                      ScreenAdapter.width(50),
                                      ScreenAdapter.height(50)),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.network(HttpsClient.picReplaceUrl("${state[index].pic}"),
                                            width: ScreenAdapter.width(300),
                                            fit: BoxFit.fitHeight),
                                        SizedBox(width: ScreenAdapter.width(50)),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: ScreenAdapter.height(20)),
                                                  child: Text("${state[index].title}",
                                                      style: TextStyle(
                                                          fontSize: ScreenAdapter.fontSize(48),
                                                          fontWeight: FontWeight.bold,
                                                          overflow: TextOverflow.ellipsis))),
                                              Text("${state[index].subTitle}",
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                      fontSize: ScreenAdapter.fontSize(34),
                                                      color: Colors.black54,
                                                      overflow: TextOverflow.ellipsis)),
                                              Container(
                                                  padding: EdgeInsets.symmetric(vertical: ScreenAdapter.height(20)),
                                                  child: Row(children: [
                                                    Expanded(
                                                        child: Column(
                                                            children: [
                                                          Text("CPU",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(42),
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black54)),
                                                          Text("Helio G25",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(32),
                                                                  color: Colors.black38))
                                                        ])),
                                                    Container(
                                                        width: 1,
                                                        height: ScreenAdapter
                                                            .height(60),
                                                        color: Colors.black12),
                                                    Expanded(
                                                        child: Column(
                                                            children: [
                                                          Text("高清拍摄",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(42),
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black54)),
                                                          Text("1300万像素",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(32),
                                                                  color: Colors.black38))
                                                        ])),
                                                    Container(
                                                        width: 1,
                                                        height: ScreenAdapter.height(60),
                                                        color: Colors.black12),
                                                    Expanded(
                                                        child: Column(
                                                            children: [
                                                          Text("超大屏",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(42),
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.black54)),
                                                          Text("6.53英寸",
                                                              style: TextStyle(
                                                                  fontSize: ScreenAdapter.fontSize(32),
                                                                  color: Colors.black38))
                                                        ]))
                                                  ])),
                                              Text("￥${state[index].price}",
                                                  style: TextStyle(
                                                      fontSize: ScreenAdapter.fontSize(48),
                                                      fontWeight: FontWeight.bold))
                                            ]))
                                      ]))),
                          !controller.hasMore && index == state.length - 1
                              ? Container(
                                  height: ScreenAdapter.height(50),
                                  alignment: Alignment.center,
                                  child: (Text("已加载完毕呦，我是有底线的~",
                                      style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(24),
                                          color: Colors.black45))))
                              : Container()
                        ])))),
        onLoading: LoadingView.circle(),
        onEmpty: Container(),
        onError: (error) => Container());
  }
}
